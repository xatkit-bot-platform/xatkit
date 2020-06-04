#!/bin/bash

# Usage
#
# ./build.sh [options]
#
# Description
#
# Build xatkit components and platforms. Generated maven artifacts are installed in ~/.m2, and bundled in a shippable product 
# stored in /build if the --product option is specified.
#
# Options
# -- all: 				builds all the xatkit components (similar to --metamodels --runtime --eclipse --platforms --libraries)
# --metamodels: 		pull and build xatkit-metamodels (the xatkit metamodels used by the execution engine and the editors)
# --runtime: 			pull and build xatkit-runtime (the xatkit execution engine)
# --eclipse: 			pull and build xatkit-eclipse (the language editors and eclipse integration plugins). If --product is   
# 			 			specified a zipped update-site is created in /update-site
# --platforms: 			pull and build all the platforms listed in /platforms
# --platform=<name>: 	pull and build the platform `name`. Note: `name` must be an existing directory in /platforms
# --libraries:			pull and build all the libraries listed in /libraries
# --library=<name>:		pull and build the library `name`. Note: `name` must be an existing directory in /libraries
# --product:			bundle the generated artifacts into a shippable product in /build. If --eclipse is specified a
#						zipped update-site is created in /update-site
# --skip-tests:			skip the build tests (equivalent to -DskipTests parameter for maven)
# --skip-mvn:			skip maven build. This can be combined with --product to refresh the content of the build/ directory
#
# Examples
#
# ./build.sh --runtime --eclipse --platforms --product --skip-tests: pull and build xatkit-runtime, xatkit-eclipse, and all the
# 																	 platforms listed in /platforms and bundle them in /build
# ./build.sh --platform=xatkit-chat-platform --product: 			 pull and build xatkit-chat platform and install it in /build
#																	 (other artifacts in /build are not updated)
# ./build.sh --runtime --product:									 pull and build xatkit-runtime and install it in /build (other
#																	 artifacts in build/ are not updated)


# Build the provided platform and install it if --product is specified
# param $1: the name of the directory containing the platform to build (e.g. xatkit-chat-platform)
build_platform() {
	platform=$1
	platform_name=${platform%"-platform"}
	cd $XATKIT_DEV/platforms/$platform
	echo "Building $platform"
	if [ $skip_mvn = false ]
	then
		mvn clean install $mvn_options
	fi
	mvn_result=$?
	if [ $build_product = true ]
	then
		echo "Copying created artifacts"
		# The directory has been deleted in the clean phase
		mkdir -p $XATKIT_DEV/build/plugins/platforms/$platform
		cp runtime/target/$platform_name-runtime*.jar $XATKIT_DEV/build/plugins/platforms/$platform
		unzip platform/target/$platform_name-platform*.zip -d $XATKIT_DEV/build/plugins/platforms/$platform
	fi
}

build_library() {
	library=$1
	library_name=${library%"-library"}
	cd $XATKIT_DEV/libraries/$library
	echo "Building $library"
	if [ $skip_mvn = false ]
	then
		mvn clean install $mvn_options
	fi
	mvn_result=$?
	if [ $build_product = true ]
	then
		echo "Copying created artifacts"
		mkdir -p $XATKIT_DEV/build/plugins/libraries/$library
		unzip target/$library_name-library*.zip -d $XATKIT_DEV/build/plugins/libraries/$library
	fi
}

# Returns 0 if $2 contains $1, 1 otherwise
containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

if [ ! -d $XATKIT_DEV ]
then
	echo "XATKIT_DEV environment variable not set, please run the install script"
	exit 1
fi

checkRequirements() {
	echo "Checking requirements"
	command -v java
	if [ $? != 0 ] 
	then
		echo "Xatkit build script requires Java 8, please install JDK 8 (https://www.java.com/en/download/) and restart this script"
		exit 1
	fi
	command -v unzip
	if [ $? != 0 ]
	then
		echo "Xatkit build script requires unzip, please install unzip and restart this script"
		exit 1
	fi
	command -v git
	if [ $? != 0 ] 
	then
		echo "Xatkit build script requires git, please install git and restart this script"
		exit 1
	fi
	command -v mvn
	if [ $? != 0 ] 
	then
		echo "Xatkit build script requires Maven, please install Maven (https://maven.apache.org/) and restart this script"
		exit 1
	fi
}

checkRequirements

cd $XATKIT_DEV

mvn_options=""
build_metamodels=false
build_runtime=false
build_product=false
build_eclipse=false
skip_mvn=false
all_platforms=$(ls -d platforms/* | xargs -n 1 basename)
all_libraries=$(ls -d libraries/* | xargs -n 1 basename)
platforms_to_build=()
libraries_to_build=()

for arg in "$@"
do
	shift
	case "$arg" in
		"--all")			build_metamodels=true
							build_runtime=true
							build_eclipse=true
							platforms_to_build=$all_platforms
							libraries_to_build=$all_libraries;;
		"--metamodels")		build_metamodels=true;;
		"--runtime")		build_runtime=true;;
		"--eclipse")		build_eclipse=true;;
		"--platforms")		platforms_to_build=$all_platforms;;
		"--platform="*)		platform=${arg#*=}
							containsElement $platform ${all_platforms[@]}
							if [ $? == 0 ]
							then
								platforms_to_build=$platform
							else
								echo "Cannot build platform $platform, the directory platforms/$platform doesn't exist"
								exit 1
							fi;;
		"--libraries")		libraries_to_build=$all_libraries;;
		"--library="*)		library=${arg#*=}
							containsElement $library ${all_libraries[@]}
							if [ $? == 0 ]
							then
								libraries_to_build=$library
							else
								echo "Cannot build library $library, the directory library/$library doesn't exist"
								exit 1
							fi;;
		"--skip-tests") 	mvn_options="$mvn_options -DskipTests" ;;
		"--skip-mvn")		skip_mvn=true ;;
		"--product")		mvn_options="$mvn_options -Pbuild-product"; build_product=true ;;
		*) 					echo "Unknown argument $arg"; exit 1
	esac
done

cd $XATKIT_DEV

# Cleaning the build/ folder
if [ $build_product = true ]
then
	for platform in $platforms_to_build
	do
		echo "Cleaning $platform"
		rm -rf $XATKIT_DEV/build/plugins/platforms/$platform
	done
	for library in $libraries_to_build
	do
		echo "Cleaning $library"
		rm -rf $XATKIT_DEV/build/plugins/libraries/$library
	done
	if [ $build_runtime = true ]
	then
		echo "Cleaning Runtime"
		rm -f $XATKIT_DEV/build/bin/xatkit-nodep-jar-with-dependencies.jar
	fi
	if [ $build_eclipse = true ]
	then
		echo "Cleaning Update site"
		rm -rf $XATKIT_DEV/build/update-site
		mkdir -p $XATKIT_DEV/build/update-site
	fi
	echo "Cleaning Xatkit Examples"
	rm -rf $XATKIT_DEV/build/examples
	mkdir -p $XATKIT_DEV/build
	mkdir -p $XATKIT_DEV/build/plugins/platforms
	mkdir -p $XATKIT_DEV/build/plugins/libs
	mkdir -p $XATKIT_DEV/build/bin
else
	echo "--product not set, nothing to clean"
fi

cd $XATKIT_DEV

# Install the top-level pom (always needs to be done)
cd $XATKIT_DEV
echo "Building Xatkit Parent"
if [ $skip_mvn = false ] 
then
	# Do not put the mvn options, they are not required here
	mvn clean install
fi


if [ $build_metamodels = true ]
then
	cd $XATKIT_DEV/xatkit-metamodels
	echo "Building Xatkit Metamodels"
	if [ $skip_mvn = false ] 
	then
		mvn clean install $mvn_options
	fi
	# Nothing to do related to product: xatkit-metamodels is bundled in xatkit-runtime.
fi

# Eclipse needs to be built before the runtime component to make sure it is built with the latest version
# of the language parsers.
if [ $build_eclipse = true ]
then
	cd $XATKIT_DEV/xatkit-eclipse
	echo "Building Xatkit Eclipse Plugins"
	if [ $skip_mvn = false ]
	then
		mvn clean install $mvn_options
	fi
	if [ $build_product = true ]
	then
		echo "Copying update site"
		find "./update/com.xatkit.update/target/" -iregex ".*\.zip" -exec cp {} "$XATKIT_DEV/build/update-site/" \;
		#cp "update/com.xatkit.update/target/*.zip" "$XATKIT_DEV/build/update-site/"
	fi
fi

if [ $build_runtime = true ]
then
	cd $XATKIT_DEV/xatkit-runtime
	echo "Building Xatkit Runtime"
	if [ $skip_mvn = false ]
	then
		mvn clean install $mvn_options
	fi
	if [ $build_product = true ]
	then
		echo "Copying created artifacts"
		cp core/target/xatkit-nodep-jar-with-dependencies.jar $XATKIT_DEV/build/bin/
	fi
else
	echo "Skipping Runtime build"
fi

cd $XATKIT_DEV/platforms

echo "Building Xatkit platforms:"
printf '\t%s\n' ${platforms_to_build[@]}

abstract_platforms=$(find -name '.abstract' -printf '%h\n' | sed -r 's|/[^/]+$||' | xargs basename)

for abstract_platform in $abstract_platforms
do
	containsElement "$abstract_platform" ${platforms_to_build[@]}
	if [ $? == 0 ]
	then
		echo "Building abstract platform $abstract_platform"
		build_platform $abstract_platform
	fi
done

cd $XATKIT_DEV/platforms
concrete_platforms=$platforms_to_build

for i in "${abstract_platforms[@]}"
do
	concrete_platforms=${concrete_platforms[@]//"$i"}
done

for concrete_platform in $concrete_platforms
do
	echo "Building concrete platform $concrete_platform"
	build_platform $concrete_platform
done

cd $XATKIT_DEV/libraries

echo "Building Xatkit libraries:"
printf '\t%s\n' ${libraries_to_build[@]}
for library in $libraries_to_build
do
	echo "Building library $library"
	build_library $library
done

if [ $build_product = true ]
then
	echo "Copying Xatkit scripts"
	scripts=$(find $XATKIT_DEV/scripts -follow -maxdepth 1 \( -name '*.sh' -o -name '*.bat' \))
	for script in $scripts
	do
		echo "Copying $script"
		cp $script $XATKIT_DEV/build/
	done

	bin_scripts=$(find $XATKIT_DEV/scripts/bin -follow -maxdepth 1 \( -name '*.sh' -o -name '*.bat' \))
	for script in $bin_scripts
	do
		echo "Copying $script"
		cp $script $XATKIT_DEV/build/bin/
	done
	echo "Copying Xatkit Examples"
	cp -r $XATKIT_DEV/xatkit-examples $XATKIT_DEV/build/examples
	rm -rf $XATKIT_DEV/build/examples/.git
	rm $XATKIT_DEV/build/examples/.gitignore
fi

cd $XATKIT_DEV

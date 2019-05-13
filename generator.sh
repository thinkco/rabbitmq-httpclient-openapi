#!/usr/bin/env bash

CURRENT_DIR=`pwd`
TEMP_DIR=.scratch
GENERATOR=openapi-generator
SOURCE_FILE=rabbitmq.3.7.1.oas2.json
PACKAGE_NETCORE=Thinkcode.RabbitMQ.OpenAPI

# Is environment sane?
command -v $GENERATOR >/dev/null 2>&1 || { echo >&2 "I require \"$GENERATOR\" but it's not installed. Download from 'https://github.com/OpenAPITools/openapi-generator'. Aborting."; exit 1; }

generate_aspnetcore() {
    CONFIG_FILE=aspnetcore.json
    DESTINATION_DIR=aspnetcore
    DESTINATION_TMP=generated/temp-aspnetcore
    # Remove previously generated files
    rm -f $CONFIG_FILE
    rm -rf $DESTINATION_TMP
    # Create generation configuration file.
    cat <<EOT >> $CONFIG_FILE
{
    "packageName" : "$PACKAGE_NETCORE",
    "packageVersion": "1.0.3",
    "targetFramework": "netcoreapp2.0",
    "hideGenerationTimestamp": true,
    "sortParamsByRequiredFlag": true,
    "useDateTimeOffset": true,
    "useCollection": false,
    "returnICollection": false,
    "netCoreProjectFile": true,
    "validatable": false,
    "optionalAssemblyInfo" : true
}
EOT

    # Generate main project.
    openapi-generator generate -i $SOURCE_FILE -g csharp-netcore -o $DESTINATION_DIR -c $CONFIG_FILE
    openapi-generator generate -i $SOURCE_FILE -g openapi-yaml -o $DESTINATION_DIR/docs -c $CONFIG_FILE
    openapi-generator generate -i $SOURCE_FILE -g cwiki -o $DESTINATION_DIR/docs -c $CONFIG_FILE

    # Post Generation Customize
    sed -i '' 's#<Authors>OpenAPI</Authors>#<Authors>Carlos Lozano Diez</Authors>#' $DESTINATION_DIR/src/$PACKAGE_NETCORE/$PACKAGE_NETCORE.csproj
    sed -i '' 's#<Company>OpenAPI</Company>#<Company>ThinkCode</Company>#' $DESTINATION_DIR/src/$PACKAGE_NETCORE/$PACKAGE_NETCORE.csproj
    sed -i '' 's#<AssemblyTitle>OpenAPI Library</AssemblyTitle>#<AssemblyTitle>Rabbitmq HTTP API Client</AssemblyTitle>#' $DESTINATION_DIR/src/$PACKAGE_NETCORE/$PACKAGE_NETCORE.csproj
    sed -i '' 's#<Copyright>No Copyright</Copyright>#<Copyright>Copyright 2019 Carlos Lozano Diez</Copyright>#' $DESTINATION_DIR/src/$PACKAGE_NETCORE/$PACKAGE_NETCORE.csproj
    sed -i '' 's#<Description>A library generated from a OpenAPI doc</Description>#<Description>RabbitMQ HTTP API Client for .netCore, tested with v3.7.x of RabbitMQ</Description>#' $DESTINATION_DIR/src/$PACKAGE_NETCORE/$PACKAGE_NETCORE.csproj

    # .gitignore
    wget -O $DESTINATION_DIR/.gitignore "https://www.gitignore.io/api/java,maven,macos,aspnetcore,intellij+all,visualstudio,visualstudiocode"
    # Clean-up
    rm -f $CONFIG_FILE
}

# Download specifications
rm -rf $TEMP_DIR && mkdir -p $TEMP_DIR
generate_aspnetcore
cd $CURRENT_DIR
rm -rf $TEMP_DIR

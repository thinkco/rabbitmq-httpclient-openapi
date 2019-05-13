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
    DESTINATION_DIR=aspnetcore2
    DESTINATION_TMP=generated/temp-aspnetcore
    # Remove previously generated files
    rm -f $CONFIG_FILE
    rm -rf $DESTINATION_TMP
    # Create generation configuration file.
    cat <<EOT >> $CONFIG_FILE
{
    "packageName" : "$PACKAGE_NETCORE",
    "packageVersion": "1.0.0",
    "targetFramework": "netcoreapp2.0",
    "hideGenerationTimestamp": true,
    "sortParamsByRequiredFlag": true,
    "useDateTimeOffset": true,
    "useCollection": true,
    "returnICollection": true,
    "netCoreProjectFile": true,
    "validatable": true
}
EOT

    # Generate main project.
    openapi-generator generate -i $SOURCE_FILE -g csharp-netcore -o $DESTINATION_DIR -c $CONFIG_FILE
    openapi-generator generate -i $SOURCE_FILE -g openapi-yaml -o $DESTINATION_DIR/docs -c $CONFIG_FILE
    openapi-generator generate -i $SOURCE_FILE -g cwiki -o $DESTINATION_DIR/docs -c $CONFIG_FILE
    
    # Customizations to generated artefacts
    sed -i '' 's#netcoreapp2.1#netcoreapp2.2#' $DESTINATION_DIR/src/$PACKAGE_NETCORE/$PACKAGE_NETCORE.csproj
    # Compatibility to 2.2
    sed -i '' 's#CompatibilityVersion.Version_2_1#CompatibilityVersion.Version_2_2#' $DESTINATION_DIR/src/$PACKAGE_NETCORE/Startup.cs
    # Default JSON serialisation preferences
    ex -s -c '24i|using Newtonsoft.Json;' -c x $DESTINATION_DIR/src/$PACKAGE_NETCORE/Startup.cs
    ex -s -c '59i|                    opts.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;' -c x $DESTINATION_DIR/src/$PACKAGE_NETCORE/Startup.cs
    ex -s -c '60i|                    opts.SerializerSettings.DateFormatHandling = DateFormatHandling.IsoDateFormat;' -c x $DESTINATION_DIR/src/$PACKAGE_NETCORE/Startup.cs
    ex -s -c '61i|                    opts.SerializerSettings.DateTimeZoneHandling = DateTimeZoneHandling.Utc;' -c x $DESTINATION_DIR/src/$PACKAGE_NETCORE/Startup.cs
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

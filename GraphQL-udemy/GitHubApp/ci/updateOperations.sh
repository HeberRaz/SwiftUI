SCHEMA_NAME="GitHubAppSchema"
# Go to previous directory
cd -
# Remove outdated package
rm -rf $SCHEMA_NAME.package
# Initialize the code generation configuration
./apollo-ios-cli init --schema-namespace $SCHEMA_NAME --module-type swiftPackageManager --overwrite
# Generate updated package
./apollo-ios-cli generate
# Rename generated package to contain .package extension
mv $SCHEMA_NAME $SCHEMA_NAME.package
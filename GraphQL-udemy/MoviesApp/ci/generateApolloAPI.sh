SCHEMA_NAME="MoviesSchema"

# Go to previous directory
cd -

# Download updated local schema
apollo client:download-schema --endpoint=http://localhost:4000 schema.graphqls

# Initialize the code generation configuration
./apollo-ios-cli init --schema-namespace $SCHEMA_NAME --module-type swiftPackageManager --overwrite

# Generate updated package
./apollo-ios-cli generate
# Deploy.ps1  - automated deployment of super-service 

# Step 1: Run Automated Tests
Write-Host "Step 1: Running automated tests..."
cd .\super-service
dotnet test
cd ..

# Step 2: Package the Application as a Docker Image - super-service-image
Write-Host "Step 2: Packaging the application as a Docker image..."
docker build -t super-service-image -f Dockerfile .

# Step 3: Deploy and Run the Image to create container
Write-Host "Step 3: Deploying and running the image locally..."
docker run -d -p 8080:80 --name super-service-container super-service-image

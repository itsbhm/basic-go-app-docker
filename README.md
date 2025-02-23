# Basic Go App in Docker

This repository contains a simple Go web server that runs inside a Docker container.

## File Structure

```
/basic-go-app-docker
│-- Dockerfile
│-- main.go
```

## Running the Application

### 1. Build the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t basic-go-app .
```

This will create a Docker image named `basic-go-app`.

### 2. Run the Docker Container

To start a container from the built image, use:

```sh
docker run -d -p 80:8080 --name basic-go-app-container basic-go-app
```

Explanation:
- `-d`: Runs the container in detached mode (in the background).
- `-p 80:8080`: Maps port 80 on your machine (public access) to port 8080 inside the container.
- `--name basic-go-app-container`: Assigns a name to the container (`basic-go-app-container`).
- `basic-go-app`: The name of the Docker image to run.

### 3. Check Running Containers

To see the running containers, use:

```sh
docker ps
```

If you want to see all containers (including stopped ones), use:

```sh
docker ps -a
```

### 4. Access the Application

Once the container is running, open your browser and visit:

```
http://localhost
```

You should see the response:

```
Hello, Go in Docker!
```

### 5. View Logs

To see logs from the running container, use:

```sh
docker logs basic-go-app-container
```

To follow logs in real time:

```sh
docker logs -f basic-go-app-container
```

### 6. Stop the Container

To stop the running container, use:

```sh
docker stop basic-go-app-container
```

### 7. Restart the Container

To restart a stopped container:

```sh
docker start basic-go-app-container
```

### 8. Remove the Container

To remove the container completely:

```sh
docker rm basic-go-app-container
```

If the container is running, stop it first:

```sh
docker stop basic-go-app-container && docker rm basic-go-app-container
```

### 9. Remove the Docker Image

To remove the built image:

```sh
docker rmi basic-go-app
```

### 10. Execute Commands Inside the Running Container

To open a shell inside the container:

```sh
docker exec -it basic-go-app-container sh
```

This gives you an interactive shell inside the container.

## License

This project is licensed under the **MIT License**. See the [LICENSE](./LICENSE) file for details.
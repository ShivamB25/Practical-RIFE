# Use an official NVIDIA CUDA runtime as the base image
FROM nvidia/cuda:11.3.0-devel-ubuntu20.04

# Set the working directory in the container
WORKDIR /app

# Install Python and necessary dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Install common Python development tools
RUN pip3 install --no-cache-dir -r requirements.txt

# Set environment variables for interactive shell
ENV PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Create a non-root user and switch to it
RUN useradd -ms /bin/bash appuser
USER appuser

# Set the entrypoint to start a bash shell by default
ENTRYPOINT ["/bin/bash"]

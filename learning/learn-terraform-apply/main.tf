provider "docker" {}

provider "random" {}

provider "time" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "random_pet" "nginx" {
  length = 2
}

resource "docker_container" "nginx" {
  count = 4
  image = docker_image.nginx.latest
  name  = "nginx-${random_pet.nginx.id}-${count.index}"

  ports {
    internal = 80
    external = 8000 + count.index
  }
}


resource "docker_image" "redis" {
  name         = "redis:latest"
  keep_locally = true
}

resource "time_sleep" "sleep" {
  depends_on = [
    docker_container.nginx
  ]

  create_duration = "60s"
}

resource "docker_container" "my_redis" {
  depends_on = [
    time_sleep.sleep
  ]
  image = docker_image.redis.latest
  name  = "my_redis"

  ports {
    internal = 6379
    external = 6379
  }
}

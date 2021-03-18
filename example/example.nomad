job "example" {
  datacenters = ["dc1"]
  type = "service"

  group "example" {
    task "hello-world" {
      driver = "hello-world-example"

      //driver = "exec"
      
      //config {
      //  command = "/bin/bash"
      //  args = ["-c","while true; do sleep 500; done"]
      //}

      artifact {
        source      = "https://github.com/sayarg/nomad-rookout/raw/main/hello-world.jar"
        destination = "/local/hello-world.jar"
        mode = "file"
      }
      artifact {
        source      = "https://repository.sonatype.org/service/local/repositories/central-proxy/content/com/rookout/rook/0.1.160/rook-0.1.160.jar"
        destination = "/local/rook.jar"
        mode = "file"
      }

      config {
        class     = "rookout.examples.HelloWorld"
        class_path = "/local/hello-world.jar"
      }
    }
  }
}

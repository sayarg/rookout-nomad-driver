job "example" {
  datacenters = ["dc1"]
  type = "service"

  group "example" {
    volume "rookout_grp" {
      type = "host"
      source = "rookout_vol"
      read_only = false
    }

    task "hello-world" {
      driver = "java-rookout"
      //driver = "java"

      artifact {
        source      = "https://github.com/sayarg/nomad-rookout/raw/main/hello-world.jar"
        destination = "/local/hello-world.jar"
        mode = "file"
      }
      
      config {
        class     = "rookout.examples.HelloWorld"
        class_path = "/local/hello-world.jar"
      }

      volume_mount {
        volume      = "rookout_grp"
        destination = "/rookout"
        read_only = false
      }
    }
  }
}

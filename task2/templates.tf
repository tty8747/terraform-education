data "template_file" "init" {
  template = file("templates/init.tpl")
  vars = {
    packages = "git nginx"
  }
}

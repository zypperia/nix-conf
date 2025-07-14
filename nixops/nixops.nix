{
  network = {
    description = "libvirtD network";
    storage.legacy = {
      databasefile = "~/.nixops/deployments.nixops";
    };
  };
  gitlab = { config, pkgs, ...}: {
#    deployment.targetEnv = "libvirtd";
#    deployment.libvirtd.imageDir = "/var/lib/libvirt/images";
    #deployment.targetHost = "10";
    deployment.keys.gitlab-databasePasswordFile.text = "agxr";
    deployment.keys.gitlab-initialRootPasswordFile.text = "agxr";

    services.gitlab = {
      enable = true;
      databasePasswordFile = "/run/keys/gitlab-databasePasswordFile";
      initialRootPasswordFile = "/run/keys/gitlab-initialRootPasswordFile";
    };
  };
}

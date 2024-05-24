
- improve selinux container label permissions. Right now, sometimes, the host volumes must be
  mounted with a `:z` label to make them available inside the container. Add a quick check before
  the run command that automatically sets correct permissions.


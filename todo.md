
- improve selinux container label permissions. Right now, sometimes, the host volumes must be
  mounted with a `:z` label to make them available inside the container. Add a quick check before
  the run command that automatically sets correct permissions.
- enable shared clipboard between host and vim container
- make run script to execute (and potentially build) only local image.
- consider a permanent mount for files like spelling dictionaries, bookmarks, history
- add ctags integration
- experiment with various LSP and ale integration
- add ctrl-backspace instead of ctrl-w


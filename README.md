Ansible playbooks
=================

These are the roles and main playbook that I use for my laptop and
cloud servers.

Note that I have not published the inventory directory; to make this
playbook usable, you will have to fill this in yourself. I will work
on making this easier in the near future.

The desktop roles install GNOME 3 and a decent number of applications.
To run the desktop roles, you will need to define the following
variables:

 - `user`: Main username of your account.
 - `group`: Primary group of your user account; should be a user-private
   group for a personally-managed system.
 - `email`: Your primary e-mail address.
 - `graphics_vendor`: intel or nouveau for now.
 - `laptop`: True if the host is a laptop.
 - `games`: True if you want to install games and packages like Steam.
 - `media`: True if you want to install music and video players.

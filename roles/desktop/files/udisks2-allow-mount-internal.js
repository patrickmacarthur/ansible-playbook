/* Managed by Ansible */
/* Taken from:
 * https://gist.github.com/grawity/3886114#file-udisks2-allow-mount-internal-js
 */

polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
         action.id == "org.freedesktop.udisks.filesystem-mount-system-internal") &&
        subject.local && subject.active && subject.isInGroup("wheel"))
    {
            return polkit.Result.YES;
    }
});

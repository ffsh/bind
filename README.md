# bind

Einstellungen für DNS auf den Gateways



Anleitung:

useradd -m -s /bin/bash dnsbind

su - dnsbind

git clone https://github.com/ffod/bind.git

chmod +x bind/update*

exit

*/15 * * * * root /home/dnsbind/bind/updatestofrei.sh > /dev/null 2>&1
*/15 * * * * root /home/dnsbind/bind/updatelauen.sh > /dev/null 2>&1


Einträge für default Zones:
zone "freifunk-stormarn.de" {
        type master;
        file "/etc/bind/db.de.freifunk-stormarn";
};

zone "stormarn.freifunk.net" {
        type master;
        file "/etc/bind/db.net.freifunk.stormarn";
};
zone "freifunk-lauenburg.de" {
        type master;
        file "/etc/bind/db.de.freifunk-lauenburg";
};

zone "lauenburg.freifunk.net" {
        type master;
        file "/etc/bind/db.net.freifunk.lauenburg";
};

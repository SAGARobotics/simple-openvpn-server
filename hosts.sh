#!/bin/bash

#The admin interface for OpenVPN

identifier="[b53115cfd1313a60f2f46ab498a4961b]"

echo "Content-type: text/plain"
echo ""
echo "# *-*-*-*-*-*-*-* $identifier *-*-*-*-*-*-*-*"
echo "# auto-generated by L-CAS OpenVPN (`date`) $identifier"

NUMBEROFCLIENTS=$(tail -n +2 /etc/openvpn/easy-rsa/pki/index.txt | grep -c "^V")
if [[ "$NUMBEROFCLIENTS" = '0'  ]]; then
            echo "# no hosts defined"
        else
                    sort -k5 /etc/openvpn/easy-rsa/pki/index.txt | while read c; do
                                    if [[ $(echo $c | grep -c "^V") = '1'  ]]; then
                                                                clientName=$(echo $c | cut -d '=' -f 2)
                                                                                        client_ip=`grep "^$clientName," /etc/openvpn/ipp.txt | cut -f2 -d","`
                                                                                                                if [ "$client_ip"  ]; then
                                                                                                                                                    echo "$client_ip        $clientName.saga.vpn    $clientName     # $identifier"
                                                                                                                                                                            fi
                                                                                                                                                                                            fi
                                                                                                                                                                                                    done
                                                                                                                                                                                                    #< /etc/openvpn/easy-rsa/pki/index.txt
                                                                                                                                                                                                fi
                                                                                                                                                                                                echo "# *-*-*-*-*-*-*-* $identifier *-*-*-*-*-*-*-*"
                                                                                                                                                                                                exit 0

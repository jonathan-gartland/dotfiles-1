function setupCDPATH -d "Define CDPATH"
    # clear CDPATH
    set -e CDPATH

    # update CDPATH with directories specific to each system
    addToCDPATH .
    addToCDPATH ~
    addToCDPATH ~/CRMS
    addToCDPATH ~/Desktop
    addToCDPATH ~/src
    addToCDPATH ~/work
    addToCDPATH /web
    addToCDPATH /web1
    addToCDPATH /web2
    addToCDPATH /web3
    addToCDPATH /web4
    addToCDPATH /web5
    addToCDPATH /webdev
end

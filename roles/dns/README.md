# DNS installation and configuration

## About

Purpose of this role is to install and provide configuration for Bind9 DNS server.

Documentation describing structure and usage of this role can be found here: [Confluence](https://pixeltechnology.atlassian.net/wiki/spaces/TI/pages/267616404/DNS+role+documentation)

## Dependencies

### General

- Ansible version 2.x (developed and tested on 2.13.5)

### Configuration files

Tasks from this role use jinja2 templates to configure application.
There are one place where configuration files are stored.
The default configuration is placed at\
`<role-directory>/templates/db.j2`\
`<role-directory>/templates/db.reverse.j2`\
`<role-directory>/templates/named.conf.j2` \
`<role-directory>/templates/named.conf.options.j2`

## Variables

To get all information about variables please browse `defaults/main.yml`.

## Usage

```yaml
    - name: DNS deployment
      ansible.builtin.include_role:
        name: "{{ DNS_application }}"
      loop:
        - DNS
      loop_control:
        loop_var: DNS_application
      when: DNS is defined and DNS == true
```

  Remember to set the required variables for the above-mentioned roles.

## Maintainer Information

[DevOps Team](devops@pixel.com.pl)

## Author Information

[Pawel Siuda-Witkowski](p.siuda@pixel.com.pl)
[Andrzej Szczepaniak](a.szczepaniak@pixel.com.pl)

grafana_repository:
  pkgrepo.managed:
    - humanname: Grafana
    - name: deb https://packages.grafana.com/oss/deb stable main
    - file: /etc/apt/sources.list.d/grafana.list
    - gpgcheck: 1
    - key_url: https://packages.grafana.com/gpg.key

grafana-server:
  pkg.installed:
    - name: grafana
    - require:
      - pkgrepo: grafana_repository
  service.running:
    - name: grafana-server
    - enable: True
    - reload: True

# Disable transparent huge paging

{% set locations = [
    '/sys/kernel/mm/transparent_hugepage/enabled',
    '/sys/kernel/mm/transparent_hugepage/defrag'
] %}

{% for location in locations %}
echo 'never' > {{ location }}:
  cmd.run:
    - onlyif: '[ -d /sys/kernel/mm/transparent_hugepage ]'
{% endfor %}

project_name: "ge_2020"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#

localization_settings: {
  default_locale: en
  localization_level: permissive
}

# aragonite: yes

constant: positive_format {
  value: "{% if value < 0 %}<p style=\"color:red; \">({{rendered_value}}){% else %} {{rendered_value}} {% endif %}"
}

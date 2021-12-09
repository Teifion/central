Find and replace the following

<!-- Change all .eex to .heex -->
find . -depth -name "*.leex" -exec sh -c 'f="{}"; mv -- "$f" "${f%.leex}.heex"' \;
find . -depth -name "*.eex" -exec sh -c 'f="{}"; mv -- "$f" "${f%.eex}.heex"' \;

<!-- Standard attributes -->
Find: =(['"])<%=\s?(.*?)\s?%>\1
Replace: ={$2}

<!-- Attributes with a combination of static and variable -->
Find: =(['"])([^<"']*?)(?:<%=\s?)([^<]*?)(?:\s?%>)([^<"']*?)\1
Replace: ={"$2#{$3}$4"}

<!-- Replace with xxx: -->
sidebar_active\('[a-z]+?'\);
tint_page[^;]+?;

<!-- Then replace this with nothing -->
<script type="text/javascript" charset="utf-8">
  $(function() {
    xxx
    xxx
  });
</script>



<!-- checkboxes -->
<%= central_component "checkbox",
  name: "category[public]",
  id: "category_public",
  value: "true",
  label: "Visible",
  checked: @changeset.data.public == true
%>

<!-- Next up -->
Any search.html pages need to have the class="card" stuff swapped for a single <div class="search-row">

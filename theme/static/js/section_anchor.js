document.addEventListener('DOMContentLoaded', function() {
  var section = document.querySelector('div.section[id]');
  if (section) {
    var header = section.querySelector('h1, h2, h3, h4, h5, h6');
    if (header) {
      var id = section.id;
      var link = document.createElement('a');
      link.href = '#' + id;
      link.textContent = header.textContent;
      header.textContent = '';
      header.appendChild(link);
    }
  }
});

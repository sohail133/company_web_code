$( document ).ready(function() {
    tinymce.init({
        selector: '.tinymce',
        plugins: 'link image code',
        toolbar: 'undo redo | bold italic | alignleft aligncenter alignright | code | tick',
        setup: function(editor) {
            editor.ui.registry.addIcon('tick', '<svg viewBox="0 0 24 24"><path fill="currentColor" d="M6.5 14.1L3.4 11l-1.4 1.4 4.5 4.5L18.6 6.7l-1.4-1.4z"></path></svg>');
            editor.ui.registry.addButton('tick', {
                tooltip: 'Double Tick',
                icon: 'tick',
                onAction: function() {
                    editor.insertContent('&#10004;&#10004;');
                }
            });
        }
    });

    $('.data-tables').DataTable({
        searching: false,
        lengthChange: false,
        paging: false
    });

    $('body').on('change', '.title_filter', function(){
        var title = $('.title_filter').val();
        $.ajax({
            url: window.location.pathname,
            type: "get",
            dataType: 'script',
            data: {title: title}
        })
    });
});

  
  
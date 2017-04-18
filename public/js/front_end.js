
if (typeof NProgress != 'undefined') {
    $(document).on('page:fetch',   function() { NProgress.set(0.3); });
    $(document).on('page:change',  function() { NProgress.done(); });
    $(document).on('page:restore', function() { NProgress.remove(); });
}
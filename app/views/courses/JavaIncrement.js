<script>
$(function () {
    var num_added = 0;
    var added = 0;
    var all_data = {};
    $('#fileupload').fileupload({
          complete: function (e, data) {
            window.location = "<%= root_url %>";
        },
          singleFileUploads: false
        }).on('fileuploadadd', function (e, data) {num_added++;}
        ).on('fileuploadprocessalways', function (e, data) {
            if(added < num_added)
            {
            if (added == 0)
            all_data = data;
            else
            {
            $.each(data['files'], function(i, file){
            all_data['files'].push(file);
            });
            $.each(data['context'], function(i, context){
            all_data['context'].push(context);
            });
            }
            added++;
            if (added == num_added)
            {
            added++;
            all_data.submit();
            }
            return false;
            }
            }
            ).on('fileuploaddone', function (e, data) {num_added = 0; added = 0;});

});
</script>

var attendance = {

  init: function(data) {

    $.ajaxSetup ({
      cache: false
    });

    this.preload_images(data);
    this.display_students(data);
  },

  // Displays the students when the page loads
  display_students: function(data) {
    for(var user_id in data.students) {
      var student = data.students[user_id];

      var student_div = $('<div class="student no_select"></div>')
        .html('<div class="student_name no_select">' + student.user_name + '</div>')
        .data('user_id', user_id)
        .css({opacity: 0.9 })
        .hover(function() {
            $(this).css({opacity: 1.0 })
          },
          function() {
            $(this).css({opacity: 0.9 })
          }
        )
        .click(function() {

          // 1 = present, 2 = absent, 3 = tardy, 4 = excused
          var attendance;

          // Rotate image
          if($(this).hasClass('present')) {
            $(this).removeClass('present').addClass('absent');
            attendance = 2;
          }
          else if($(this).hasClass('absent')) {
            $(this).removeClass('absent').addClass('tardy');
            attendance = 3;
          }
          else if($(this).hasClass('tardy')) {
            $(this).removeClass('tardy').addClass('excused');
            attendance = 4;
          }
          else {
            $(this).removeClass('excused').addClass('present');
            attendance = 1;
          }

          // Update our local records
          var user_id = $(this).data('user_id');
          data.attendance[user_id] = { attendance: attendance };

          // Send update to server
          $.ajax({
            url: 'attendances/alter?' +
                   'date=' + data.class_date + 
                   '&section=' + data.section_id +
                   '&user=' + user_id +
                   '&attendance=' + attendance,
            processData: false,
            dataType: 'json',
            success:function(a) {
              // var s = ''
              // for(var key in a) {
              //   s += key + ': ' + a[key] + '\n';
              // }
              // alert(s);
            },
            error:function() {
              $('#ajax_errors')
                .html('Failed to update the attendance.')
                .fadeOut(3000, function() {
                  $('#ajax_errors').html('').css('display','block');
                }
              );
            }
          });
      });

      // If an attendance value has already been set for this student on this date
      if(data.attendance.hasOwnProperty(user_id)) {
        var attendance_value = data.attendance[user_id].attendance;

        switch(attendance_value) {
          case 1: student_div.addClass('present'); break;
          case 2: student_div.addClass('absent'); break;
          case 3: student_div.addClass('tardy'); break;
          case 4: student_div.addClass('excused'); break;
        }
      }
      else {
        student_div.addClass('present');

        // Load the rest of the students into the attendance hash as present
        data.attendance[user_id] = { attendance: 1 };
      }

      $('#students_container').append(student_div);
    }
  },

  // Preload the attendance images so there isn't a slight hesitation when
  // the professor clicks on a student and the next image has to load.
  preload_images: function(data) {
    for(var key in data.images) {
      new Image().src = data.images[key];
    }
  }
};
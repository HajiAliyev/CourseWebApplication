var globBtnId = '';
var globStudentId = 0;

$(function () {

    $('body').layout({applyDemoStyles: true});

    $('.ui-layout-east,.ui-layout-west,.ui-layout-center').css('background-color', 'aqua');

    $('#newLessonDialogId').dialog({
        title: 'New Lesson',
        height: 400,
        width: 500,
        modal: true,
        autoOpen: false,
        buttons: {
            "Save": function () {
                addLesson();
                $(this).dialog('close');
            },
            "Close": function () {
                $(this).dialog('close');
            }
        }
    });

    $('#newStudentDialogId').dialog({
        title: 'New Student',
        height: 420,
        width: 500,
        modal: true,
        autoOpen: false,
        buttons: {
            "Save": function () {
                addStudent();
                $(this).dialog('close');
            },
            "Close": function () {
                $(this).dialog('close');
            }
        }
    });


    $('#editStudentDialogId').dialog({
        title: 'Update Student',
        height: 400,
        width: 500,
        modal: true,
        autoOpen: false,
        buttons: {
            "Update": function () {
                updateStudent();
                $(this).dialog('close');
            },
            "Close": function () {
                $(this).dialog('close');
            }
        }
    });


    $('#newTeacherDialogId').dialog({
        title: 'New Teacher',
        height: 400,
        width: 500,
        modal: true,
        autoOpen: false,
        buttons: {
            "Save": function () {
                addTeacher();
                $(this).dialog('close');
            },
            "Close": function () {
                $(this).dialog('close');
            }
        }
    });

    $('#newScheduleDialogId').dialog({
        title: 'New Schedule',
        height: 400,
        width: 500,
        modal: true,
        autoOpen: false,
        buttons: {
            "Save": function () {
                addSchedule();
                $(this).dialog('close');
            },
            "Close": function () {
                $(this).dialog('close');
            }
        }
    });


    $('#studentDataBtnId').click(function () {
        getStudentList();
        $('#newBtnId').val('New Student');
        $('#keywordId').val('');
    });

    $('#teacherDataBtnId').click(function () {
        getTeacherList();
        $('#newBtnId').val('New Teacher');
        $('#keywordId').val('');
    });

    $('#lessonDataBtnId').click(function () {
        getLessonList();
        $('#newBtnId').val('New Lesson');
        $('#keywordId').val('');
    });

    $('#scheduleDataBtnId').click(function () {
        getScheduleList();
        $('#newBtnId').val('New Schedule');
        $('#keywordId').val('');
    });


    $('.btndesign').click(function () {
        globBtnId = $(this).attr('id');
    });

    $('#newBtnId').click(function () {
        switch (globBtnId) {
            case 'studentDataBtnId':
                $('#newStudentDialogId').load('cs?action=newStudent', function () {
                    $(this).dialog('open');
                });
                break;
            case 'teacherDataBtnId':
                $('#newTeacherDialogId').load('views/newTeacher.jsp', function () {
                    $(this).dialog('open');
                });
                break;
            case 'lessonDataBtnId':
                $('#newLessonDialogId').load('views/newLesson.jsp', function () {
                    $(this).dialog('open');
                });
                break;
            case 'scheduleDataBtnId':
                $('#newScheduleDialogId').load('cs?action=newSchedule', function () {
                    $(this).dialog('open');
                });
                break;
            default:
                alert("Please first select menu.")
        }
    });

    $('#searchBtnId').click(function () {

    });

    $('#keywordId').keyup(function () {
        var keyword = $(this).val();
        switch (globBtnId) {
            case 'studentDataBtnId':
                searchStudent(keyword);
                break;
            case 'teacherDataBtnId':

                break;
            case 'lessonDataBtnId':

                break;
            case 'scheduleDataBtnId':
                searchSchedule(keyword);
                break;
            default:
                alert("Please first select menu.")

        }
    });

});

function getStudentList() {
    $.ajax({
        url: 'cs?action=getStudentList',
        type: 'get',
        dataType: 'html',  //xml, json, html, text formatinda melumat qayida biler
        success: function (data) {
            $('.ui-layout-center').html(data);
        },
        error: function () {
            alert('Problem bash verdi.')
        }
    });
}

function getTeacherList() {
    $.ajax({
        url: 'cs?action=getTeacherList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('.ui-layout-center').html(data);
        },
        error: function () {
            alert('Problem bash verdi.')
        }
    });

}

function getLessonList() {
    $.ajax({
        url: 'cs?action=getLessonList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('.ui-layout-center').html(data);
        },
        error: function () {
            alert('Problem bash verdi.');
        }
    });
}

function addStudent() {
    var name = $('#nameId').val();
    var surname = $('#surnameId').val();
    var dob = $('#dobId').val();
    var address = $('#addressId').val();
    var phone = $('#phoneId').val();
    var email = $('#emailId').val();
    var roleName = $('#roleNameId').val();
    var username= $('#usernameId').val();

    var data = {
        name: name,
        surname: surname,
        dob: dob,
        address: address,
        phone: phone,
        email: email,
        role: roleName,
        username:username
    };

    $.ajax({
        url: 'cs?action=addStudent',
        type: 'POST',
        data: data,
        dataType: 'text',
        success: function (data) {
            if (data == 'success') {
                alert('Student elave olundu');
                getStudentList();
            } else {
                alert(data);
            }
        }
    });

}

function getScheduleList() {
    $.ajax({
        url: 'cs?action=getScheduleList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('.ui-layout-center').html(data);
        },
        error: function () {
            alert('Problem bash verdi.');
        }
    });

}

function addSchedule() {

    var studentCombo = $('#studentComboId').val();
    var teacherCombo = $('#teacherComboId').val();
    var lessonCombo = $('#lessonComboId').val();

    var data = {
        studentCombo: studentCombo,
        teacherCombo: teacherCombo,
        lessonCombo: lessonCombo
    };

    $.ajax({
        url: 'cs?action=addSchedule',
        type: 'post',
        data: data,
        dataType: 'text',
        success: function (data) {
            if (data == 'success') {
                alert('Schedule elave olundu');
                getScheduleList();
            } else {
                alert('Problem oldu!');
            }
        }
    });
}

function addTeacher() {
    var name = $('#nameId').val();
    var surname = $('#surnameId').val();
    var dob = $('#dobId').val();
    var address = $('#addressId').val();
    var phone = $('#phoneId').val();
    var email = $('#emailId').val();

    data = {
        name: name,
        surname: surname,
        dob: dob,
        address: address,
        phone: phone,
        email: email
    };
    $.ajax({
        url: 'cs?action=addTeacher',
        type: 'POST',
        data: data,
        dataType: 'text',
        success: function (data) {
            if (data == 'success') {
                alert('Teacher elave olundu');
                getTeacherList();
            } else {
                alert('Problem oldu!!!');
            }
        }
    });
}

function addLesson() {
    var lessonName = $('#lessonNameId').val();
    var lessonTime = $('#lessonTimeId').val();
    var lessonPrice = $('#lessonPriceId').val();

    data = {
        lessonName: lessonName,
        lessonTime: lessonTime,
        lessonPrice: lessonPrice
    };

    $.ajax({
        url: 'cs?action=addLesson',
        type: 'POST',
        data: data,
        dataType: 'text',
        success: function (data) {
            if (data == 'success') {
                alert('Lesson elave edildi.');
                getLessonList();
            } else {
                alert('Problem bash verdi!!!');
            }
        }
    });

}

function editStudent(studentId) {
    globStudentId = studentId;
    $.ajax({
        url: 'cs?action=editStudent',
        type: 'get',
        data: 'studentId=' + studentId,
        dataType: 'text',
        success: function (data) {
            $('#editStudentDialogId').html(data);
            $('#editStudentDialogId').dialog('open');
        }

    });
}

function updateStudent() {
    var name = $('#nameIdU').val();
    var surname = $('#surnameIdU').val();
    var dob = $('#dobIdU').val();
    var address = $('#addressIdU').val();
    var phone = $('#phoneIdU').val();
    var email = $('#emailIdU').val();

    var data = {
        name: name,
        surname: surname,
        dob: dob,
        address: address,
        phone: phone,
        email: email,
        studentId: globStudentId
    };

    $.ajax({
        url: 'cs?action=updateStudent',
        type: 'POST',
        data: data,
        dataType: 'text',
        success: function (data) {
            if (data == 'success') {
                alert('Student update edildi');
                getStudentList();
            } else {
                alert('Problem oldu!');
            }
        }
    });
}

function deleteStudent(studentId) {
    var isDelete = confirm("Are you sure?");
    if (isDelete) {
        alert('OK');
    }
}

function searchStudent(keyword) {
    $.ajax({
        url: 'cs?action=searchStudent',
        type: 'get',
        dataType: 'html',
        data: 'keyword=' + keyword,
        success: function (data) {
            $('.ui-layout-center').html(data);
        }
    });
}

function searchSchedule(keyword) {
    $.ajax({
        url: 'cs?action=searchSchedule',
        type: 'get',
        dataType: 'html',
        data: 'keyword=' + keyword,
        success: function (data) {
            $('.ui-layout-center').html(data);
        }
    });
}

function getTeacherComboByLessonId(lessonId) {
    $.ajax({
        url: 'cs?action=getTeacherComboByLessonId',
        type: 'get',
        dataType: 'html',
        data: "lessonId=" + lessonId,
        success: function (data) {
            $('#advTeacherCombo').html(data);
        }
    });
}

function advancedSearchSchedule() {
    var advLessonCombo = $('#advLessonCombo').val();
    var advTeacherCombo = $('#advTeacherCombo').val();
    var advBeginDateId = $('#advBeginDateId').val();
    var advEndDateId = $('#advEndDateId').val();

    var data = {
        advLessonCombo: advLessonCombo,
        advTeacherCombo: advTeacherCombo,
        advBeginDateId: advBeginDateId,
        advEndDateId: advEndDateId
    };

    $.ajax({
        url: 'cs?action=advancedSearchSchedule',
        type: 'get',
        data: data,
        dataType: 'html',
        success: function (data) {
            $('#scheduleDivId').html(data);
        }
         
    });
}



console.log("Reply Module.....");

var replyService = (function () {
    function add(reply, callback, error) {
        console.log("add reply.......");

        $.ajax({
            type: "post",
            url: "/replies/new",
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            },
        });
    }

    function getList(param, callback, error) {
        let bno = param.bno;
        let page = param.page || 1;

        $.getJSON(`/replies/pages/${bno}/${page}.json`, function (data) {
            if (callback) {
                callback(data);
            }
        }).fail(function (xhr, status, er) {
            if (error) {
                error(er);
            }
        });
    }

    function remove(rno, callback, error) {
        $.ajax({
            type: "delete",
            url: `/replies/${rno}`,
            success: function (deleteResult, status, xhr) {
                if (callback) {
                    callback(deleteResult);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            },
        });
    }

    function update(reply, callback, error) {
        console.log(`RNO: ${reply.rno}`);

        $.ajax({
            type: "put",
            url: `/replies/${reply.rno}`,
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            },
        });
    }

    function get(rno, callback, error) {
        $.get(`/replies/${rno}.json`, function (result) {
            if (callback) {
                callback(result);
            }
        }).fail(function (xhr, status, er) {
            if (error) {
                error(er);
            }
        });
    }

    function displayTime(timeValue) {
        let today = new Date();
        let gap = today.getTime() - timeValue;
        let dateObj = new Date(timeValue);

        if (gap < 1000 * 60 * 60 * 24) {
            let hh = String(dateObj.getHours()).padStart(2, "0");
            let mi = String(dateObj.getMinutes()).padStart(2, "0");
            let ss = String(dateObj.getSeconds()).padStart(2, "0");
            return `${hh}:${mi}:${ss}`;
        } else {
            let yy = dateObj.getFullYear();
            let mm = String(dateObj.getMonth() + 1).padStart(2, "0");
            let dd = String(dateObj.getDate()).padStart(2, "0");
            return `${yy}/${mm}/${dd}`;
        }
    }
    

    return {
        add: add,
        getList: getList,
        remove: remove,
        update: update,
        get: get,
        displayTime: displayTime
    };
})();

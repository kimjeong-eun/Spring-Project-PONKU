console.log("댓글 모듈 : ");

var replyService = (function() {

function add(content, csrfHeaderName, csrfTokenValue) {
    console.log("댓글 추가");

    $.ajax({
        type: 'post',
        url: '/replies/new',
        data: JSON.stringify(content),
        contentType: "application/json; charset=utf-8",
        beforeSend: function(xhr) { // 헤더에 csrf 값 추가
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
        success: function(response) {
            // 성공 시 실행할 코드를 여기에 작성
            console.log("댓글 추가 성공:", response);
        },
        error: function(xhr, status, error) {
            // 실패 시 실행할 코드를 여기에 작성
            console.error("댓글 추가 실패:", error);
        }
    });
}

	function get(id, callback, error){
		$.get("/replies/" + id + ".json", function(result){
			
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getList(param, callback, error){
		
		var id = param.id;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" + id + "/" + page + ".json",
		function(data){
			
			if(callback){
				callback(data.replyCnt, data.list);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function remove(id, replyer, callback, error){
		
		console.log(JSON.stringify({id:id, replyer:replyer}));
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + id,
			
			data : JSON.stringify({id:id, replyer:replyer}),
			contentType : "application/json; charset=utf-8",
			
			success : function(deleteResult, status, xhr){
				if (callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if (error) {
					error(er);
				}
			}
		});
	}
	function update(content, callback, error){
		
		console.log("리뷰 번호 :" + comments.id);
		
		$.ajax({
			type : 'put',
			url : '/replies' + comments.id,
			data : JSON.stringify(content),
			contentType : "apllication/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error) {
					error(er);
				}
			}
		});
		
	}
	
		function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	};
	
	return {
		add : add,
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	 };
})();


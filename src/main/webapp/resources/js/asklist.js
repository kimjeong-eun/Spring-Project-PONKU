console.log("asklist 스크립트 실행")

var askListService = (function() {

	function getListWithPaging(param, callback, error) {

		var page = param.page || 1;
		var data = {type: param.type, keyword: param.keyword, secret: param.secret};
		
		if (!param.type) { // 파라미터로 전달된 type 값이 없으면
        	data.type = '';
   		}
    	if (!param.keyword) { // 파라미터로 전달된 keyword 값이 없으면
        	data.keyword = '';
    	}
    	//if (!param.secret) { // 파라미터로 전달된 secret 값이 없으면
		//	data.secret = true;
		//}
		
		console.log("secret : " + data.secret);
				
		$.ajax({
			type: 'get',
			url: "/ask/main/" + page + ".json",
			data: data,
			success: function(result, status, xhr) {
				if (callback) {
					callback(result.askListCnt, result.list);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	function write(ask, callback, error) {
		console.log("스크립트 write 실행중 ... ");

		$.ajax({
			type: 'post',
			url: '/ask/write',
			data: JSON.stringify(ask),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	return {
		getListWithPaging: getListWithPaging,
		write: write
	};






})();
console.log("asklist 스크립트 실행")

var askListService = (function() {

	function getListWithPaging(param, callback, error) {

		var page = param.page || 1;

		$.getJSON("/ask/main/" + page + ".json",
			function(data) {
				if (callback) {
					//callback(data); // 댓글 목록을 가져온다.
					console.log(data);
					callback(data.askListCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
				}
			}).fail(function(xhr, status, err) {
				if (error) {
					error();
				}
			});
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
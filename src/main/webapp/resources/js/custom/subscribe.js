let subscribeInit = {
	version: 1,
	toSignIn: function(){
		if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")){
			location.href="/user/sign-in";
		}
	},
	subscribe: async function(companyCode, userId){
					console.log('c1 : '+companyCode);
		try {
					console.log('c2 : '+companyCode);
		    const response = await fetch(`/subCheck?companyCode=${companyCode}&userId=${userId}`);
		    if (!response.ok) {
		        throw new Error(`HTTP error! Status: ${response.status}`);
		    }
		    const res = await response.json();
            if(res==0){
				if(confirm("해당 채널에 구독 되어있지 않습니다. 구독하시겠습니까?")){
					console.log('c3 : '+companyCode);
					location.href=`/subscribe?companyCode=${companyCode}&userId=${userId}`;
				}
			}else{
				if(confirm("해당 채널의 구독을 해제하시겠습니까?")){
				location.href=`/un-subscribe?companyCode=${companyCode}&userId=${userId}`;
			}
			}
		} catch (error) {
		    console.error("Fetch error:", error);
		}
		
	},
}

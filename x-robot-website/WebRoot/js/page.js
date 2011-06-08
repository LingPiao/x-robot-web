function searchPage(pageForm)
{
	pageForm.submit();
}

function query(pageForm)
{
	pageForm.page.value = 1;
	searchPage(pageForm);
}

function goPage(pageForm)
{
	var vcurPage = 1 * pageForm.curPage.value;
	var vpage = 1 * pageForm.page.value;
	var vmaxPage = 1 * pageForm.maxPage.value;
	
	if (vmaxPage == 0 || vcurPage == vpage)
		return;
		
	if(pageForm.page.value == "")
	{
		alert("«Î ‰»Î“≥¬Î£°");
		pageForm.page.focus();
		return;
	}
	
	if(vpage <= 0 || vpage > vmaxPage)
	{
		alert("≥¨π˝“≥¬Î∑∂Œß,«Î÷ÿ–¬ ‰»Î£°");
		pageForm.page.focus();
		return;
	}	

	searchPage(pageForm);
}

function goPageByImg(pageForm, type)
{
	var vcurPage = 1 * pageForm.curPage.value;
	var vmaxPage = 1 * pageForm.maxPage.value;
	var vpage = vcurPage;
	
	if (vmaxPage == 0)
		return;
	
	if (type == "FIRST")
		vpage = 1;
	else if (type == "PERVIOUS" && vpage > 1)
		vpage = vpage - 1;
	else if (type == "NEXT" && vpage < vmaxPage)
		vpage = vpage + 1
	else if (type == "LAST")
		vpage = vmaxPage;
	else 
		return;
				
	if (vpage == vcurPage)
		return;

	pageForm.page.value	= vpage;
	
	searchPage(pageForm);	
}

function goPageByNum(pageForm, pageNum)
{
	pageForm.page.value = pageNum;
	
	searchPage(pageForm);
}
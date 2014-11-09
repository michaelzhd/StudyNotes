
	function keywordsBrush()
	{
		var keywordsArray =["and","del","for","is","raise",
							"assert","elif","from","lamda",
							"return","break","else","global",
							"not","try","class","except","if",
							"or","while","continue","exec",
							"import","pass","with","def",
							"finally","in","print","yield"];

		for(var index in keywordsArray)
		{
			var reObj =eval("/(\\b"+keywordsArray[index]+"\\b)/g");
			
			var keywords = document.getElementsByTagName('pre');

			for(var i=0;i<keywords.length;i++)
			{
				document.getElementsByTagName("pre")[i].innerHTML =keywords[i].innerHTML.replace(reObj,"<font color =orange>$1</font>");
			}
		}
	}
		

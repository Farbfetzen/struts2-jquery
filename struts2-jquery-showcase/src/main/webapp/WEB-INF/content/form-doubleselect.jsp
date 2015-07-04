<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<h2>A AJAX based Double Select Box</h2>

<p class="text">
	Two select boxes with remote json content. The second select box content is dependent from the first one.
</p>
<strong>Reload example with two select boxes.</strong>
<s:form id="formSelectReload" action="echo" theme="simple" cssClass="yform">
	<fieldset>
		<legend>AJAX Form</legend>
		<div class="type-text">
			<label for="language">Language: </label>
			<s:url var="remoteurl" action="jsonsample"/>
			<sj:select
					href="%{remoteurl}"
					id="language"
					onChangeTopics="reloadsecondlist"
					name="language"
					list="languageObjList"
					listKey="myKey"
					listValue="myValue"
					emptyOption="true"
					headerKey="-1"
					headerValue="Please Select a Language"
					/>
		</div>
		<div class="type-text">
			<label for="echo">Framework: </label>
			<s:url var="remoteurl" action="jsonsample"/>
			<sj:select
					href="%{remoteurl}"
					id="selectWithReloadTopic"
					formIds="formSelectReload"
					reloadTopics="reloadsecondlist"
					name="echo"
					list="reloadList"
					emptyOption="true"
					headerKey="-1"
					headerValue="Please Select a Framework"
					/>
		</div>
		<div class="type-button">
			<sj:submit
					id="submitFormSelectReload"
					targets="result"
					value="AJAX Submit"
					indicator="indicator"
					button="true"
					/>
			<img id="indicator"
			     src="images/indicator.gif"
			     alt="Loading..."
			     style="display:none"
					/>
		</div>
	</fieldset>
</s:form>
<br/>
<strong>Reload example with one select box and an buttonset.</strong>
<s:form id="formSelectCheckBox" action="echo" theme="xhtml">
	<s:url var="remoteurl" action="jsonsample"/>
	<sj:select
			href="%{remoteurl}"
			id="languageSelect"
			onChangeTopics="reloadcheckboxes"
			name="language"
			list="languageObjList"
			listKey="myKey"
			listValue="myValue"
			emptyOption="true"
			headerKey="-1"
			headerValue="Please Select a Language"
			label="Language"
			required="true"
			/>
	<s:url var="remoteurl" action="jsonsample"/>
	<sj:checkboxlist
			href="%{remoteurl}"
			id="frameworkCheckboxes"
			formIds="formSelectCheckBox"
			reloadTopics="reloadcheckboxes"
			name="echo"
			list="reloadList"
			label="Framework"
			required="true"
			onChangeTopics="submitCheckboxForm"
			/>
	<sj:submit
			id="submitFormSelectCheckBox"
			listenTopics="submitCheckboxForm"
			targets="result"
			value="AJAX Submit"
			indicator="indicator2"
			cssStyle="display : none;"
			/>
</s:form>
<img id="indicator2"
     src="images/indicator.gif"
     alt="Loading..."
     style="display:none"
		/>

<strong>Result Div :</strong>

<div id="result" class="result ui-widget-content ui-corner-all">Submit a form.</div>

<h4>Source Code</h4>

<sj:tabbedpanel id="localtabs" cssClass="list">
<sj:tab id="tab1" target="jsp" label="JSP Code"/>
<sj:tab id="tab2" target="java" label="Java Code"/>
<sj:tab id="tab2" target="config" label="Configuration"/>
<div id="jsp">
	  <pre>
            <code class="html">
&lt;strong&gt;Reload example with two select boxes.&lt;/strong&gt;
 &lt;s:form id=&quot;formSelectReload&quot; action=&quot;echo&quot; theme=&quot;simple&quot; cssClass=&quot;yform&quot;&gt;
	&lt;fieldset&gt;
		&lt;legend&gt;AJAX Form&lt;/legend&gt;
		&lt;div class=&quot;type-text&quot;&gt;
			&lt;label for=&quot;language&quot;&gt;Language: &lt;/label&gt;
			&lt;s:url id=&quot;remoteurl&quot; action=&quot;jsonsample&quot;/&gt;
			&lt;sj:select
				href=&quot;%{remoteurl}&quot;
				id=&quot;language&quot;
				onChangeTopics=&quot;reloadsecondlist&quot;
				name=&quot;language&quot;
				list=&quot;languageObjList&quot;
				listKey=&quot;myKey&quot;
				listValue=&quot;myValue&quot;
				emptyOption=&quot;true&quot;
				headerKey=&quot;-1&quot;
				headerValue=&quot;Please Select a Language&quot;
			/&gt;
		&lt;/div&gt;
		&lt;div class=&quot;type-text&quot;&gt;
			&lt;label for=&quot;echo&quot;&gt;Framework: &lt;/label&gt;
			&lt;s:url id=&quot;remoteurl&quot; action=&quot;jsonsample&quot;/&gt;
			&lt;sj:select
				href=&quot;%{remoteurl}&quot;
				id=&quot;selectWithReloadTopic&quot;
				formIds=&quot;formSelectReload&quot;
				reloadTopics=&quot;reloadsecondlist&quot;
				name=&quot;echo&quot;
				list=&quot;reloadList&quot;
				emptyOption=&quot;true&quot;
				headerKey=&quot;-1&quot;
				headerValue=&quot;Please Select a Framework&quot;
			/&gt;
		&lt;/div&gt;
		&lt;div class=&quot;type-button&quot;&gt;
			&lt;sj:submit
				id=&quot;submitFormSelectReload&quot;
				targets=&quot;result&quot;
				value=&quot;AJAX Submit&quot;
				indicator=&quot;indicator&quot;
				button=&quot;true&quot;
				/&gt;
				&lt;img id=&quot;indicator&quot;
					src=&quot;images/indicator.gif&quot;
					alt=&quot;Loading...&quot;
					style=&quot;display:none&quot;
				/&gt;
		&lt;/div&gt;
	&lt;/fieldset&gt;
&lt;/s:form&gt;
&lt;br/&gt;
&lt;strong&gt;Reload example with one select box and an buttonset.&lt;/strong&gt;
 &lt;s:form id=&quot;formSelectCheckBox&quot; action=&quot;echo&quot; theme=&quot;xhtml&quot;&gt;
	&lt;s:url id=&quot;remoteurl&quot; action=&quot;jsonsample&quot;/&gt;
	&lt;sj:select
		href=&quot;%{remoteurl}&quot;
		id=&quot;languageSelect&quot;
		onChangeTopics=&quot;reloadcheckboxes&quot;
		name=&quot;language&quot;
		list=&quot;languageObjList&quot;
		listKey=&quot;myKey&quot;
		listValue=&quot;myValue&quot;
		emptyOption=&quot;true&quot;
		headerKey=&quot;-1&quot;
		headerValue=&quot;Please Select a Language&quot;
		label=&quot;Language&quot;
		required=&quot;true&quot;
	/&gt;
	&lt;s:url id=&quot;remoteurl&quot; action=&quot;jsonsample&quot;/&gt;
	&lt;sj:checkboxlist
		href=&quot;%{remoteurl}&quot;
		id=&quot;frameworkCheckboxes&quot;
		formIds=&quot;formSelectCheckBox&quot;
		reloadTopics=&quot;reloadcheckboxes&quot;
		name=&quot;echo&quot;
		list=&quot;reloadList&quot;
		label=&quot;Framework&quot;
		required=&quot;true&quot;
		onChangeTopics=&quot;submitCheckboxForm&quot;
	/&gt;
	&lt;sj:submit
		id=&quot;submitFormSelectCheckBox&quot;
		listenTopics=&quot;submitCheckboxForm&quot;
		targets=&quot;result&quot;
		value=&quot;AJAX Submit&quot;
		indicator=&quot;indicator2&quot;
		cssStyle=&quot;display : none;&quot;
	/&gt;
&lt;/s:form&gt;
&lt;img id=&quot;indicator2&quot;
	src=&quot;images/indicator.gif&quot;
	alt=&quot;Loading...&quot;
	style=&quot;display:none&quot;
/&gt;

&lt;strong&gt;Result Div :&lt;/strong&gt;
&lt;div id=&quot;result&quot; class=&quot;result ui-widget-content ui-corner-all&quot;&gt;Submit a form.&lt;/div&gt;
			</code>
	  </pre>
</div>
<div id="java">
	  <pre>
            <code class="java">
@ParentPackage(value = &quot;showcase&quot;)
public class JsonSample extends ActionSupport {

  private static final long   serialVersionUID = -2223948287805083119L;
  private static final Log    log              = LogFactory.getLog(JsonSample.class);
  private List&lt;String&gt;        languageList;
  private List&lt;ListValue&gt;     languageObjList;
  private Map&lt;String, String&gt; languageMap;
  private List&lt;String&gt;        reloadList;
  private String              language;

  @Actions( {
    @Action(value = &quot;/jsonsample&quot;, results = {
      @Result(name = &quot;success&quot;, type = &quot;json&quot;)
    })
  })
  public String execute()
  {

    log.info(&quot;build json lists language : &quot; + language);

    languageList = new ArrayList&lt;String&gt;();
    languageObjList = new ArrayList&lt;ListValue&gt;();
    languageMap = new HashMap&lt;String, String&gt;();

    languageList.add(&quot;Java&quot;);
    languageList.add(&quot;PHP&quot;);
    languageList.add(&quot;C#&quot;);

    languageMap.put(&quot;J&quot;, &quot;Java&quot;);
    languageMap.put(&quot;P&quot;, &quot;PHP&quot;);
    languageMap.put(&quot;C&quot;, &quot;C#&quot;);

    languageObjList.add(new ListValue(&quot;J&quot;, &quot;Java&quot;));
    languageObjList.add(new ListValue(&quot;P&quot;, &quot;PHP&quot;));
    languageObjList.add(new ListValue(&quot;C&quot;, &quot;C#&quot;));

    reloadList = new ArrayList&lt;String&gt;();
    if (language != null &amp;&amp; language.equalsIgnoreCase(&quot;J&quot;))
    {
      reloadList.add(&quot;Struts2&quot;);
      reloadList.add(&quot;MyFaces&quot;);
      reloadList.add(&quot;Tapestry&quot;);
    }
    else if (language != null &amp;&amp; language.equalsIgnoreCase(&quot;P&quot;))
    {
      reloadList.add(&quot;CakePHP&quot;);
      reloadList.add(&quot;Symfony&quot;);
      reloadList.add(&quot;Zend&quot;);
    }
    else if (language != null &amp;&amp; language.equalsIgnoreCase(&quot;C&quot;))
    {
      reloadList.add(&quot;NStruts&quot;);
      reloadList.add(&quot;ProMesh.NET&quot;);
      reloadList.add(&quot;Websharp&quot;);
    }

    return SUCCESS;
  }

  public String getJSON()
  {
    return execute();
  }

  public List&lt;String&gt; getLanguageList()
  {
    return languageList;
  }

  public Map&lt;String, String&gt; getLanguageMap()
  {
    return languageMap;
  }

  public List&lt;ListValue&gt; getLanguageObjList()
  {
    return languageObjList;
  }

  public List&lt;String&gt; getReloadList()
  {
    return reloadList;
  }

  public void setLanguage(String language)
  {
    this.language = language;
  }
}
			</code>
	  </pre>
</div>
<div id="config">
	  <pre>
            <code class="xml">
    &lt;package name=&quot;showcase&quot; extends=&quot;struts-default,json-default&quot; namespace=&quot;/&quot;&gt;
    &lt;/package&gt;
			</code>
	  </pre>
</div>
</sj:tabbedpanel>

package com.acme.doktorics.listener;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;

import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.util.HtmlUtils;

import com.acme.doktorics.event.MessageEvent;

@Component
public class MessageEventListener implements ApplicationListener<MessageEvent> {

	 private Collection<ScriptSession> sessionsByPage = new HashSet<ScriptSession>();
	
	@Override
	public void onApplicationEvent(MessageEvent event) {
		ScriptBuffer scriptBuffer = new ScriptBuffer();
		WebContext webContext = WebContextFactory.get();
		String currentPage = registerScriptSession(webContext);

		addJavaScriptAction(event, scriptBuffer);
		broadcastMessage(scriptBuffer);
	}

	private String registerScriptSession(WebContext webContext) {
		String currentPage = null;
		if (webContext != null) {
			currentPage = webContext.getCurrentPage();
			sessionsByPage = webContext.getScriptSessionsByPage(currentPage);
		}
		return currentPage;
	}

	private void addJavaScriptAction(MessageEvent event,
			ScriptBuffer scriptBuffer) {
		scriptBuffer.appendCall("showMessage", htmlEscape(event.getFrom()),
				htmlEscape(event.getTextMessage()),
				htmlEscape(event.getDate()),
				htmlEscape(event.getId().toString()));
	}

	private String htmlEscape(String string) {
		return HtmlUtils.htmlEscape(string);
	}

	private void broadcastMessage(ScriptBuffer scriptBuffer) {
		for (Iterator<ScriptSession> iterator = sessionsByPage.iterator(); iterator
				.hasNext();) {
			ScriptSession session = (ScriptSession) iterator.next();
			session.addScript(scriptBuffer);
		}
	}

}
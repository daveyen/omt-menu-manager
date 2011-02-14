<resource:accordion skin="default" />

...

<richui:accordion style="width: 500px;">
    <richui:accordionItem caption="Sample 1">
    A sample text.
    </richui:accordionItem>

    <richui:accordionItem caption="Sample 2">
    Another sample text.
    </richui:accordionItem>

    <richui:accordionItem caption="Sample 3">
    Even another sample text.
    </richui:accordionItem>
</richui:accordion>

<resource:autoComplete skin="default" />
<resource:autoComplete skin="default" />
...

<g:form>
    <richui:autoComplete name="person" action="${createLinkTo('dir': 'person/searchAJAX')}" />
    <richui:autoComplete name="searchperson" action="${createLinkTo('dir': 'person/searchAJAX')}" 
              onItemSelect="document.location.href = '${createLinkTo(dir: 'person/show')}/' + id;" />
    <richui:autoComplete name="persons" delimChar="," action="${createLinkTo('dir': 'person/searchAJAX')}" />
</g:form>
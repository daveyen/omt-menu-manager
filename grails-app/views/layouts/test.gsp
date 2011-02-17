

<g:form controller="yourControllerName" method="post" action="test" 
  enctype="multipart/form-data">
    <input type="file" name="file"/>
    <input type="submit"/>
</g:form>

<!--<resource:flow />
...

<richui:flow reflection="true" slider="true" onClickScroll="true">
    <img src="/menu-manager/images/mainMenu/1.jpg" alt="One"/>
    <img src="/menu-manager/images/mainMenu/2.jpg" alt="Two"/>
    <img src="/menu-manager/images/mainMenu/3.jpg" alt="Three"/>
</richui:flow>



<resource:carousel />
...

<richui:carousel direction="horizontal" carouselStyle="height: 450px;" itemsStyle="height: 400px;">

    <richui:carouselItem>
        <img src="/menu-manager/images/mainMenu/1.jpg" alt="One"/><br/>One
    </richui:carouselItem>

    <richui:carouselItem>
        <img src="/menu-manager/images/mainMenu/2.jpg" alt="Two"/><br/>Two
    </richui:carouselItem>

    <richui:carouselItem>
        <img src="/menu-manager/images/mainMenu/3.jpg" alt="Three"/><br/>Three
    </richui:carouselItem>
</richui:carousel>


--><!--<resource:accordion skin="default" />
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
...

<g:form>
    <richui:autoComplete name="person" action="${createLinkTo('dir': 'person/searchAJAX')}" />
    <richui:autoComplete name="searchperson" action="${createLinkTo('dir': 'person/searchAJAX')}" 
              onItemSelect="document.location.href = '${createLinkTo(dir: 'person/show')}/' + id;" />
    <richui:autoComplete name="persons" delimChar="," action="${createLinkTo('dir': 'person/searchAJAX')}" />
</g:form>-->
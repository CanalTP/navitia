<a name="isochrones"></a>![Isochrones](/images/isochrons.png)Isochrones
===================================

>[Try it on Navitia playground (click on "MAP" buttons for "wow effect")](http://canaltp.github.io/navitia-playground/play.html?request=https%3A%2F%2Fapi.navitia.io%2Fv1%2Fcoverage%2Fsandbox%2Fisochrones%3Ffrom%3D2.377097%3B48.846905%26datetime%3D20160505T080000%26max_duration%3D2000%26min_duration%3D1000)


Whether using a specific set of coordinates or a general location, you can find places within 
your reach and their corresponding travel times, using a variety of transportation options. 
You can even specify the maximum amount of time you want to spare on travel and find 
the quickest way to reach your destination.

[![a simple isochrone request on Navitia playground](isochrones_example.png)](http://canaltp.github.io/navitia-playground/play.html?request=https%3A%2F%2Fapi.navitia.io%2Fv1%2Fcoverage%2Fsandbox%2Fisochrones%3Ffrom%3D2.377097%3B48.846905%26datetime%3D20160505T080000%26max_duration%3D2000%26min_duration%3D1000)

Isochrone computing exposes information under two formats:

-   either [Journeys](#journeys) service which provides a list with all the reachable stops from a potential destination 
with their respective arrival times, travel times and number of matches. Here is a fiddle example:

<a
    href="http://jsfiddle.net/gh/get/jquery/2.2.2/CanalTP/navitia/tree/documentation/slate/source/examples/jsFiddle/isochron/"
    target="_blank"
    class="button button-blue">
    Code it yourself on JSFiddle
</a>

-   or [isochrones](#isochrones_api) service which provides a multi-polygon stream in order to plate colors directly on a map, 
or to filter geocoded objects inside the polygon. Here is a fiddle example:

<a
    href="http://jsfiddle.net/gh/get/jquery/2.2.2/CanalTP/navitia/tree/documentation/slate/source/examples/jsFiddle/graphical_isochrone/"
    target="_blank"
    class="button button-blue">
    Code it yourself on JSFiddle
</a>


You can use these APIs (click on them for details):

-   **[Places](#places)** : autocomplete on geographical data to find the departure and destination points from an input text.
-   **[Journeys](#journeys)** : Compute all journeys from a departure point to every reachable point, 
and returns a list of all reachable points, ordered by time to reach.
-   **[isochrones](#isochrones_api)** : Compute all journeys from a departure point to every reachable point, 
and returns multiple geoJson ready to be displayed on map ! This service is currently in beta.


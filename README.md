# gothic-online-server

Need to add <code> config.xml </code> in the root dir.

Base with some placeholders below.
```
<server>
	<config public=true host_name="serverName" max_slots=slotNum port=exposedPort rcon_pass="rconPass" />
	<master url="http://api.gothic-online.com.pl" />
	<version build=0 />
	<world name="NEWWORLD\\NEWWORLD.ZEN" />
	<description>
	<![CDATA[
		<center>
			<font color=red>Template<br>
		</center>
	]]>
	</description>

	<!-- Default -->
	<import src="default/scripts.xml" />
	
	<!-- Gamemode -->
	<import src="gamemodes/prototype/scripts.xml" />
	
	<!-- Ids -->
	<items src="items.xml" />
	<mds src="mds.xml" />
	
	<wayfile map="NEWWORLD" src="waypoints/newworld.xml" />
	<wayfile map="OLDWORLD" src="waypoints/oldworld.xml" />
	<wayfile map="ADDONWORLD" src="waypoints/addonworld.xml" />
</server>
```

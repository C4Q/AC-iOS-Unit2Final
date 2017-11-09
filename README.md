# AC-iOS-Unit2Final

# The Assessment

### Overview

**TL;DR:** Your app will display a table full of crayon colors, and clicking on a color will show you a view that lets you mess around with that color's values.

**The Specifics:** Your app is to have a ```TableViewController``` that segues to a Detail View once a row is tapped. 

You will be provided with a ```Crayon``` model that has all these colors.

The first view should contain a table that displays a list of ```Crayon``` names with the row backgrounds set to the corresponding color. The Detail View is a single ```ViewController``` that has:

* 3 hidden ```Sliders```, for R, G, and B values, 
* a hidden ```Stepper``` to "step" up or down for alpha values,
* ```Labels``` to display information, and
* a ```SegmentedControl``` to alterate between showing the ```Sliders``` or ```Stepper```.

These values and outlets are all sync'd together. 

### Steps to achieve MVP

1. Set the background color of the rows by building a ```UIColor``` from with the ```Crayon``` model's red, green, and blue properties and set the textLabel's text to the color name. You **don't** need to make a custom ```TableViewCell```
to do this. Just use the default ```UITableViewCell```.

1. Implement ```prepare(for:)``` on the ```TableViewController``` in order to pass the color information over to the Detail ```ViewController```. This ```ViewController``` should have a label with the color name and color its background just as you did with the table cell row. The ```Sliders``` should be in the correct posititons as specifed by the tapped color's **RGB value**.

1. When you build your view controller, connect outlets and actions as appropriate to the 	```Slider``` and ```Stepper``` controls. Use ```Labels``` to display the Color's name, and corresponding ones next to each ```Slider``` that live-update when the ```Sliders``` are moved. 

1. Add your ```Stepper```, which increases or decreases your ```Alpha``` value by **0.1** when tapped. 

1. Don't forget you ```SegmentedControl```, which should alternate between your ```Sliders``` and ```Stepper```.

1. ```// Comment``` on the methods you end up implementing, noting whether it's a target-action method or a delegate method.

#### Things to note

1. You should divide each R, G, and B value by 255 and cast them as a ```CGFloat``` to conform to the parameters for setting up a ```UIColor```. 

1. The background color of the Detail View should update dynamically as the ```Sliders``` are slid or the ```Stepper``` is tapped. 

1. It's fine to start your Detail View off with your ```Stepper``` hidden.

#### Extra Credit
Do any of the below, or none at all, or all of 'em.

1. Create a convenience initializer on the ```Crayon``` model that uses the "hex" field to populate the the red, green, blue properties for your crayons. 

1. Use ```TextFields```, instead of ```Labels```, to show each RGB value. Typing in a value manually should affect the respective slider's positions and update the background color.

1. Have the ```Labels``` change to a lighter color to make it easier to read once the view gets too dark.

# Setup

1. Clone **your fork** locally to your laptop.

1. Work on the assignment.

1. Upon completion, commit locally. Even before you're done, commit commit commit.

	```
	git commit -am "I'm done"
	```

1. Push to your repo.

	```
	git push origin master
	```

1. Go to github and make a pull request.

1. Paste **your fork** link into canvas.

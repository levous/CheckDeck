LVModelForm
====================
A framework that interprets input form entry based on an object model.  

TODOs and Notes
--------------------
This is high level and probably makes much more sense to me than it will when you read it.  However, I hope it captures the direction I want to go with this.  I'd like to open source it either as stand alone or as part of a larger open source library.  

The goal is to merge our FormConfig architecture with something like SensibleTableView that is much more automated and simple to use yet loosely coupled so that it is easy to integrate and even easier to work around.

I'd like to pass an instance or a type def to the framework and have it produce a default form for managing it.  The automatic form should present logical cells for editing each data type, handle keyboards and scrolling, handled two way binding to the entity passed to it and provide typical default actions for save, cancel, etc.  relationships should be navigable, by default.  Each entity at the other end of the relationship should be nothing more than another implementation of the same logic.  Overriding behavior, hiding or changing attribute mapped fields, altering the presentation for relationships, etc, should be intuitive and clean.  

An ideal would be to receive a UIViewController as a result of handing a class instance to the Orchestrator that could be pushed to a navigation controller and completely managed by the orchestrator.  Customizing by inserting alternate cells (loaded from xib), viewController, etc should not require special inheritance chains.

It should be, of course, uber unit testable!

Here's a go at it:

ModelFormOrchestrator
Handles orchestration for UITableView datasource and delegate and management of ModelFormConfig.  Provides default behaviors and opportunity to override.  Consumer is passed as delegate to ModelFormOrchestrator and has the opportunity to override certain selectors to provide custom behavior.  The init will receive the target class instance for form mapping, consumer class (delegate), and any optional configuration in a ModelFormConfigDictionary

ModelFormUITableViewDataSource - implements the UITableViewDelegate protocol by interacting with its ModelFormOrchestrator instance

ModelFormUITableViewDelegate - implements the UITableViewDataSource protocol by interacting with its ModelFormOrchestrator instance

ModelFormConfigDictionary
Contains a ModelFormConfig entry per class type that modifies behaviors such as field order, read-only fields, hidden fields, labels, cell type, etc

ModelFormConfig
Provides a definition that describes the form and mapping to a cocoa object.  Contains a dictionary of ModelFormConfigSection that describe each section containing rows for each property on the target class plus extended actions. 
ModelFormConfigSection
Describes a section that will be presented in a UITableView.  Each section contains a collection of rows, section title, optional section header view, (section key?)
ModelFormConfigRow
Describes a row that corresponds either to a property on the target class or an action taken against it (such as save).  Contains cellType, labelText, placeHolderText, targetEntityPropertyName, 

When initializing a ModelFormOrchestrator, the passed in class will be inspected for its properties and relationships (assume NSManagedObject but effort will be made to support plain old objC object - Pooo, hah!).  Each attribute and relationship will generate a ModelFormConfigRow in the ModelFormConfig.  Each attribute row describes the data type, mapped cell type, validation requirements, keyboard, etc.  Each relationship row points to a child ModelFormConfig.  An single section with no title will be default.  Each relationship will be walked to produce a config for each type.  Each type config will also be copied to a dictionary keyed off of type so that only one config will be present for each type.  However, a config can be replaced after init to provide alternate views.  For example, in a case where there is a lookup that has extended details, yet only a selection with a display title should be presented when navigating from parent to child, the child config can be manually configured so that it presents as needed.  The Type will still reside in the type/config dictionary but the override will be respected.

Yet to be determined:  
- mechanism for presenting display title text for navigable child relationships from a parent model form.
- many, many details

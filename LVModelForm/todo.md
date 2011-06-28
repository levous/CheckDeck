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
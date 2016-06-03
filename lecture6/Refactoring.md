# Parameter Coupling

```ruby

class FailureNotifier {
    def notify_user_of_failure
      print_to_console(failure)
    end

    def print_to_console(failure)
      @console.print(failure.to_sentence)
    end
    # What if I passed nil? Int?
}
```

---

```ruby
class JobSite
  attr_reader :contact

  def initialize(location, contact)
    @location = location
    @contact = contact
  end

  def contact_name
    if contact
      contact.name
	else
	  'no name'
  end

  def contact_phone
    if contact
      contact.phone
	else
	  'no phone'
  end
```

---

# This code sucks

- Violating Tell Don't Ask again:

- Do you evaluate to a "truthy" value? If so, I'll do something

- We'd rather just say "give me your name"

- We've co-opted nil (passing the nil singleton around)

---

#### The NullObject Pattern

```ruby

  def initialize(location, contact)
    @location = location
    @contact = contact || NullContact.new
  end

  def contact_name
    contact.name
  end

  def contact_phone
    contact.phone
  end

  class NullContact
    def name
      'no name'
    end

    def phone
      'no phone'
    end
  end
```

---

#### The NullObject Pattern

- For the cost of one stupidly-simple class:

- Removed 2 conditionals

- Removed ~10 lines of code

- Made methods clearer

- We pass Tell Don't Ask: "Dude, I need your name"

- This pattern is more widely known as "Replace conditionals with polymorphism"

- One downside: maintaining NullObject

---

## Things to Refactor: God Objects

- Objects that do too much.

- Everything seems to rely on it

- (Rails apps typically have two God Objects): User & WhateverTheAppsAbout

- Typically find these files based on most code (600+ line User class, anyone?)

---

## Things to Refactor: High-Churn Files

- Objects that I have to keep changing

- Churn Gem for Rails devs

- If you're changing a file a lot, you don't understand it well

---

## Things to Refactor: Files with Bugs

- Bugs love company

- If there was an error on line 8, there's a bug on line 9.

- The code was too complicated for you to understand it; that's why the bug is there!

---

# Books to Read

[Read this book] (http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882/ref=sr_1_1?ie=UTF8&qid=1464233555&sr=8-1&keywords=clean+code)

[Read the Bible] (http://www.amazon.com/Refactoring-Improving-Design-Existing-Code/dp/0201485672/ref=sr_1_1?ie=UTF8&qid=1464233605&sr=8-1&keywords=refactoring+improving+the+design+of+existing+code)
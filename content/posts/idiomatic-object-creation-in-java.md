+++
draft = true
date = "2019-02-26T00:00:00-00:00"
title = "Idiomatic object creation in Java"
slug = ""
tags = []
categories = []
+++

We've created a Slack bot in my team to automate a few things. One of the bot tasks is to query Jira and show all open incidents. In order
to do that, we must create domain classes to represent the Jira response structure. It ended up being something more less like the
following:

```java
public final class Issue {

  private String key;
  private Fields fields;

  public static final class Fields {
    private String summary;
    private IncidentSeverity severity;
    private List<Tag> tags;

    public static final class IncidentSeverity {
      private String severity;
    }

    public static final class Tag {
      private String value;
    }
  }

}
```

Since these classes will be used to represent the Response of a json based external service, they must be supported by a (de)serialization
library. In this case, we went with Jackson and the quickest way to make our classes compatible with Jackson is to make them follow the bean
convention (no args constructor, getters and setters). It would be less cumbersome to go with immutable classes, having all attributes
immutable and an all args constructor. With some tweaking, Jackson works well with value classes, but we did not have time for that.


## Lombok

One (not so) quick win to make this easier on the eyes, is to use [Lombok](https://projectlombok.org/):

```java
import lombok.Data;

@Data
public final class Issue {

  private String key;
  private Fields fields;

  @Data
  public static final class Fields {
    private String summary;
    private IncidentSeverity severity;

    @Data
    public static final class IncidentSeverity {
      private String severity;
    }

    @Data
    public static final class Tag {
      private String value;
    }
  }

}
```

The Data annotation will generate the boilerplate code to make this class a Java Bean:

  - No args constructor
  - Getters and setters
  - toString, equals and hashCode

## The traditional way

```java
Issue issue = new Issue();
issue.setKey("RFS-400");

Fields fields = new Fields();
fields.setSummary("Website is down");

Severity severity = new Severity();
severity.setValue("Critical");

Tag frontEndTag = new Tag();
fontEndTag.setValue("front-end");

Tag infraTag = new Tag();
infraTag.setValue("infrastructure");

List<Tag> tags = Arrays.asList(frontEndTag, infraTag);

fields.setSeverity(severity);
fields.setTags(tags);

issue.setFields(fields);
```

## Double braces

```java

import static java.util.Arrays.asList;

Issue issue = new Issue() {{
  setKey("RFS-400");

  setFields(new Issue.Fields() {{
    setSummary("Website is down");

    setSeverity(new Issue.Fields.Severity() {{
      setValue("Critical");
    }});

    setTags(asList(
      new Tag() {{
        setValue("front-end");
      }},
      new Tag() {{
        setValue("infrastructure");
      }}
    ));
  }});
}};
```

### The big catch

Double braces actually do a lot of things that are not so obvious at a first glance. Such things may introduce nasty problems that are not
worth to be dealt with for the sake of a slightly more readable code.

Therefore, a valuable advice would be to actually avoid using this approach deliberately. It may be ok to adopt it when there is not too
many classes and you don't need lots of instances of such classes. Even then, I'd still be careful.

Let's understand why.

When using double braces, we're combining three Java constructs:
  - Anonymous classes
  - Inheritance
  - Instance initialization block

The first pair of braces creates an anonymous class that inherits from the class we're instantiating:

```java
/*
This will generate a new anonymous class Issue$1 and we'll end up with an instance of that class instead of an instance of Issue.
*/
Issue issue - new Issue() {
};
```

There are tons of problems that may be caused by this:
  - Incorrect `equals` behaviour




When using double braces syntax, we end up doing a lot of (nasty) things under the hood for the sake of readability.

__Advantages:__

  - No effort required. It's plain old Java syntax

__Disadvantages:__

  - Double bracket syntax pollutes things a little bit

## Lambda based builders

```java
import static IssueCreator.issue;

Issue issue = issue(issue -> issue
  .key("RFS-400")
  .fields(fields -> fields
    .summary("Website is down")
    .severity("Critical")
    .tag("front-end")
    .tag("infrastructure")
  )
);
```

__Advantages:__

  - Much easier to read
  - Intuitive
  - Reusable/composable
  - Allows shortcuts
  - It's easier to simplify things and hide the ugly parts (like setting optional attributes as `null`)

__Disadvantages:__

  - Repetitive
  - No easy way to automate the repitition

## Bonus: Kotlin named parameters

Since we're talking about Java, Kotlin

```kotlin
class Issue(
  
)
```

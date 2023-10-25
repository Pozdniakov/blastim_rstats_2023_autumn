# Install required packages if not already installed
if (!requireNamespace("shiny", quietly = TRUE)) install.packages("shiny")
if (!requireNamespace("rentrez", quietly = TRUE)) install.packages("rentrez")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

# Load required libraries
library(shiny)
library(rentrez)
library(ggplot2)

# UI
ui <- fluidPage(
  titlePanel("PubMed Publications by Topic"),
  sidebarLayout(
    sidebarPanel(
      textInput("terms", "Enter Topics (comma-separated):", ""),
      actionButton("searchButton", "Search")
    ),
    mainPanel(
      plotOutput("pubPlot")
    )
  )
)

# Server
server <- function(input, output) {

  observeEvent(input$searchButton, {
    terms <- unlist(strsplit(input$terms, ",\\s*"))
    counts <- numeric(length(terms))

    for (i in seq_along(terms)) {
      term <- terms[i]
      if (nchar(term) > 0) {
        # Retrieve data from PubMed
        search_result <- entrez_search(db = "pubmed", term = term)
        counts[i] <- as.numeric(search_result$count)
      }
    }

    # Create a plot
    output$pubPlot <- renderPlot({
      ggplot(data = data.frame(Topic = terms, Count = counts), aes(x = Topic, y = Count)) +
        geom_bar(stat = "identity", fill = "blue", alpha = 0.7) +
        labs(title = "PubMed Publications by Topic", x = "Topic", y = "Number of Publications") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
    })
  })
}

# Run the app
shinyApp(ui = ui, server = server)

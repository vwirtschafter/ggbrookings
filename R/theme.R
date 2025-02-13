#' Brookings style ggplot2 theme
#'
#'  A theme following the Brookings style guide.
#' @param base_size base font size, given in pts.
#' @param base_family base font family. Default is "Roboto".
#' @param base_line_size line size in mm.
#' @param base_rect_size border size in mm.
#' @param web If TRUE sets the plot background color to the Brookings website background color
#' @param ticks include axis ticks. Default is FALSE.
#' @importFrom ggtext element_textbox_simple
#' @importFrom ggplot2 margin rel scale_color_gradientn scale_fill_gradientn theme theme_light unit
#' @importFrom ggplot2 `%+replace%`
#' @export
#'

theme_brookings <- function(base_size = 14,
                            base_family = "Roboto",
                            base_line_size = base_size / 24,
                            base_rect_size = base_size / 24,
                            web = FALSE,
                            ticks = TRUE) {
  # The half-line (base-fontsize / 2) sets up the basic vertical
  # rhythm of the theme. Most margins will be set to this value.
  # However, when we work with relative sizes, we may want to multiply
  # `half_line` with the appropriate relative size. This applies in
  # particular for axis tick sizes. And also, for axis ticks and
  # axis titles, `half_size` is too large a distance, and we use `half_size/2`
  # instead.

  half_line <- base_size / 2
  # Throughout the theme, we use three font sizes, `base_size` (`rel(1)`)
  # for normal, `rel(0.8)` for small, and `rel(1.2)` for large.

  t <- theme_light() %+replace%
  theme(
    # Elements in this first block aren't used directly, but are inherited
    # by others
    line =
      ggplot2::element_line(
        colour = "black",
        size = base_line_size,
        linetype = 1,
        lineend = "butt"
      ),
    rect =
      ggplot2::element_rect(
        fill = NULL,
        colour = "black",
        size = base_rect_size,
        linetype = 1
      ),
    text =
      ggplot2::element_text(
        family = base_family,
        face = "plain",
        colour = "black",
        size = base_size,
        lineheight = 1,
        hjust = 0.5,
        vjust = 0.5,
        angle = 0,
        margin = margin(),
        debug = FALSE
      ),
    axis.line = ggplot2::element_line(),
    axis.line.x = ggplot2::element_line(
      colour = "#000000",
      size = NULL,
      linetype = NULL,
      lineend = NULL
    ),
    axis.line.y = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(size = rel(0.8), colour = "#000000"),
    axis.text.x = ggplot2::element_text(margin = margin(t = 0.8 * half_line / 2), vjust = 1),
    axis.text.x.top = ggplot2::element_text(margin = margin(b = 0.8 * half_line / 2), vjust = 0),
    axis.text.y = ggplot2::element_text(margin = margin(r = 0.8 * half_line / 2), hjust = 1),
    axis.text.y.right = ggplot2::element_text(margin = margin(l = 0.8 * half_line / 2), hjust = 0),
    axis.title.x = ggplot2::element_text(
      margin = margin(t = 1.25 * half_line),
      size = rel(0.8),
      vjust = 1
    ),
    axis.title.x.top = ggplot2::element_text(
      margin = margin(b = half_line / 2),
      vjust = 0
    ),
    axis.title.y = ggplot2::element_text(
      angle = 90,
      margin = margin(r = half_line * 1.25),
      vjust = 1,
      size = rel(0.8)
    ),
    axis.title.y.right = ggplot2::element_text(
      angle = -90,
      margin = margin(l = half_line / 2),
      vjust = 0
    ),
    legend.background = ggplot2::element_rect(colour = NA),
    # legend.spacing =     unit( half_line, "pt"),
    # legend.spacing.x =    NULL,
    # legend.spacing.y =    NULL,
    # legend.margin =      margin(0,0,0,0),
    legend.key = ggplot2::element_blank(),
    legend.key.size = unit(rel(0.8), "lines"),
    legend.key.height = NULL,
    legend.key.width = NULL,
    legend.text = ggplot2::element_text(size = rel(1)),
    legend.text.align = 0,
    legend.title = ggplot2::element_blank(),
    legend.title.align = NULL,
    legend.position = "top",
    legend.direction = NULL,
    legend.justification = "center",
    # legend.box =         NULL,
    # legend.box.margin =  margin(0, 0, 0, 0, "cm"),
    # legend.box.background = ggplot2::element_blank(),
    # legend.box.spacing = unit(2 * half_line, "pt"),

    panel.background = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),
    panel.grid = ggplot2::element_line(
      colour = "#CCCCCC",
      # size = 1,
      linetype = "dotted"
    ),
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    # panel.spacing =      unit(half_line, "pt"),
    # panel.spacing.x =  unit(1.5, "lines"),
    # panel.spacing.y =  unit(2, "lines"),
    panel.ontop = FALSE,
    strip.background = ggplot2::element_rect(fill = "#003A79", colour = NA),
    strip.text = ggplot2::element_text(
      colour = "#FAFAFA",
      size = rel(0.8),
      margin = margin(0.8 * half_line, 0.8 * half_line, 0.8 * half_line, 0.8 * half_line)
    ),
    # strip.text.x =       NULL,
    # strip.text.y =       ggplot2::element_text(angle = -90),
    # strip.text.y.left =  ggplot2::element_text(angle = 90),
    # # strip.placement =    "outside",
    # strip.placement.x =  NULL,
    # strip.placement.y =  NULL,
    # strip.switch.pad.grid = unit(half_line / 2, "pt"),
    # strip.switch.pad.wrap = unit(half_line / 2, "pt"),

    plot.title = ggtext::element_textbox_simple(
      # font size "large"
      size = rel(1.2),
      color = "#003A79",
      face = "bold",
      hjust = 0,
      vjust = 1,
      margin = margin(b = half_line / 2, t = base_size)
    ),
    plot.title.position = "plot",
    plot.subtitle = ggtext::element_textbox_simple(
      # font size "regular"
      hjust = 0,
      size = rel(1),
      vjust = 1,
      margin = margin(b = base_size)
    ),
    plot.caption = ggtext::element_textbox_simple(
      # font size "small"
      size = rel(0.8),
      vjust = 1,
      color = "#666666",
      hjust = 0,
      margin = margin(t = half_line)
    ),
    plot.caption.position = "plot",
    plot.tag = ggplot2::element_text(
      size = rel(0.8),
      hjust = 0,
      vjust = 1,
      color = "#003A79"
    ),
    plot.tag.position = c(0, 1),
    plot.margin = margin(half_line, half_line, half_line * 2, half_line),
    # plot.margin = unit(c(0.5, 0.5, 2.5, 0.5), "lines"),

    complete = FALSE
  )


  if (ticks == FALSE) {
    t <- t + theme(
      axis.ticks = ggplot2::element_blank(),
      axis.ticks.x = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank()
    )
  } else {
    t <-
      t + theme(
        axis.ticks = ggplot2::element_line(colour = "#000000"),
        axis.ticks.length = unit(half_line / 2, "pt"),
        axis.ticks.length.x = NULL,
        axis.ticks.length.x.top = NULL,
        axis.ticks.length.x.bottom = NULL,
        axis.ticks.y = ggplot2::element_blank()
      )
  }

  if (web == FALSE) {
    t <-
      t + theme(plot.background = ggplot2::element_rect(fill = "#FFFFFF"))
  } else {
    t <-
      t + theme(plot.background = ggplot2::element_rect(fill = "#FAFAFA"))
  }
}


#' Title
#'
#' @param base_size base font size, given in pts.
#' @param base_family base font family. Default is "Roboto".
#' @param base_line_size line size in mm.
#' @param base_rect_size border size in mm.
#' @param ... additional arguments passed to theme_brookings()
#'
#' @importFrom ggplot2 `%+replace%`
#' @export
#'
theme_thp <- function(base_size = 12,
                      base_family = "Calibri",
                      base_line_size = base_size / 24,
                      base_rect_size = base_size / 24,
                      ...) {

  if (!requireNamespace("showtext", quietly = TRUE)) {
    stop("Package \"showtext\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  if (!requireNamespace("sysfonts", quietly = TRUE)) {
    stop("Package \"sysfonts\" needed for this function to work. Please install it.",
         call. = FALSE)
  }


  # Half line
  half_line <- base_size / 2
  # Load fonts
  # if(sum(grepl('photina|myriad-pro|helvetica_medium|helvetica_light', sysfonts::font_families())) != 4){
  #   path <- system.file(package = "ggbrookings", 'fonts')
  #   sysfonts::font_add(family = 'photina',
  #                      regular = glue::glue('{path}/Photina/Photina.ttf'))
  #   sysfonts::font_add(
  #     family = 'myriad-pro',
  #     regular = glue::glue('{path}/Myriad-Pro/MYRIADPRO-REGULAR.ttf'),
  #     bold = glue::glue('{path}/Myriad-Pro/MYRIADPRO-SEMIBOLD.ttf'),
  #     italic = glue::glue('{path}/Myriad-Pro/MYRIADPRO-CONDIT.ttf'),
  #     bolditalic = glue::glue('{path}/Myriad-Pro/MYRIADPRO-BOLDIT.ttf')
  #   )
  #
  #   sysfonts::font_add(
  #     family = 'helvetica_medium',
  #     regular = glue::glue('{path}/Helvetica/HelveticaNeueLTStd-Md.ttf'),
  #   )
  #   sysfonts::font_add(family = 'helvetica_light',
  #                      regular = glue::glue('{path}/Helvetica/HelveticaNeueLTStd-Lt.ttf'),
  #                      bold = glue::glue('{path}/Helvetica/HelveticaNeue-Bold.ttf'))
  # }
  #
  #
  # # TODO write a warning message about showtext_auto() and rendering
  # showtext::showtext_auto()
  # showtext::showtext_opts(dpi = 300)
  # if(.Platform$OS.type == 'windows'){
  #   x11()
  # }

  theme_brookings(...) %+replace%
    theme(
      text = ggplot2::element_text(
        family = base_family,
        face = "plain",
        colour = "black",
        size = base_size,
        lineheight = 1,
        hjust = 0.5,
        vjust = 0.5,
        angle = 0,
        margin = margin(),
        debug = FALSE
      ),
      plot.title = ggtext::element_textbox_simple(
        # font size "large"
        family = 'Calibri',
        size = rel(1.33),
        color = "#007363",
        hjust = 0,
        vjust = 1,
        margin = margin(b = half_line / 2, t = base_size)),
      strip.background = ggplot2::element_rect(fill = "#007363", colour = NA),
      strip.text = ggplot2::element_text(colour = "#FAFAFA",
                                size = rel(1),
                                margin = margin(0.8 * half_line, 0.8 * half_line, 0.8 * half_line, 0.8 * half_line)),
      plot.subtitle = ggtext::element_textbox_simple(
        # font size "regular"
        family = 'Calibri',
        hjust = 0,
        size = rel(1),
        vjust = 1,
        margin = margin(b = base_size)
      ),
      plot.tag = ggplot2::element_text(
        family = 'Calibri',
        size = rel(2/3),
        hjust = 0,
        vjust = 1,
        color = "#007363"
      ),
      plot.caption = ggtext::element_textbox_simple(
        # font size "small"
        size = rel(2/3),
        family = 'Calibri',
        vjust = 1,
        color = "#666666",
        hjust = 0,
        margin = margin(t = half_line)
      ),
      axis.text = ggplot2::element_text(size = rel(0.833), colour = "#000000"),
      axis.title.x = ggplot2::element_text(
        margin = margin(t = 1.25 * half_line),
        size = rel(0.833),
        vjust = 1
      ),
      axis.title.y = ggplot2::element_text(
        angle = 90,
        margin = margin(r = half_line * 1.25),
        vjust = 1,
        size = rel(0.833)
      ),
      legend.text = ggplot2::element_text(size = rel(0.833)),

    )
}


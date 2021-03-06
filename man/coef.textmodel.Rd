% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textmodel-generics.R
\name{coef.textmodel}
\alias{coef.textmodel}
\title{extract text model coefficients}
\usage{
coef.textmodel(object, ...)
}
\arguments{
\item{object}{a fitted or predicted text model object whose coefficients will be extracted}

\item{...}{unused}
}
\value{
Returns a list of named numeric vectors with the following elements:
\describe{
\item{\code{coef_feature}}{coefficients estimated for each feature}
\item{\code{coef_feature_se}}{standard errors estimated for each feature-level point estimate}
\item{\code{coef_document}}{coefficients estimated for each document}
\item{\code{coef_document_se}}{standard errors estimated for each document-level point estimate}
\item{\code{coef_document_offset}}{a document-level offset for applicable models}
\item{\code{coef_feature_offset}}{a feature-level offset for applicable models}
}
An element that is not applicable for a particular object class will be \code{NULL}, 
for instance \code{coef_documents} has no meaning for a fitted wordscores object.
}
\description{
Extract text model coefficients for documents and features, in a manner similar to \link{coef} and \link{coefficients}.
(\code{coefficients} is an alias for \link{coef}.)
}

#!/usr/bin/env bb

(require '[clojure.java.shell :refer [sh]]
         '[clojure.string :as string])

(defn sh-amixer []
  (-> (sh "amixer" "sget" "Master")
      :out
      string/split-lines))

(defn read-amixer [raw-amixer]
  (-> raw-amixer
      (as-> lines (filter (fn [line] (string/split line #"Left")) lines))
      last
      (clojure.string/split #"(?<=\[)|(?=\])")))

(defn amixer->output [amixer]
  (let [volume (nth amixer 1)
        status (nth amixer 3)]
    (if (= status "on")
      (str "<span color='#868686' size='large'>墳</span><span> "
           volume
           "</span>")
      "<span color='#868686' size='large'>婢</span>")))

(-> (sh-amixer)
    read-amixer
    amixer->output
    println)

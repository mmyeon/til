#!/bin/bash
rm -rf .cache
rm -rf public
npx gatsby build
npx gatsby serve
